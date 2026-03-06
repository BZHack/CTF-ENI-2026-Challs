require 'webrick'
require 'erb'
require 'net/smtp'

PUBLIC_ROOT = File.expand_path('../STF', __dir__)

class SimpleServlet < WEBrick::HTTPServlet::AbstractServlet
  def do_POST(request, response)
    response.status = 200
    response.content_type = 'text/html'

    if request.query.key?('firstname') && request.query.key?('lastname') && request.query.key?('email')
      @firstname = request.query['firstname']
      @lastname = request.query['lastname']
      @user_email = request.query['email']

      # Vérification que l'email est valide et appartient au domaine proton.me
      if @user_email =~ /\A(?!stf)[A-Za-z0-9._%+-]+@(proton\.me|yopmail\.com|gmail\.com|campus-eni\.fr)\z/
        begin

          # Identifiants Gmail
          gmail_user = 'challenge.stf@gmail.com'
          gmail_password = 'ouxk rgjd hnej zmkh'

          subject = "Félicitations"

          body = ERB.new("
          Félicitations M. / Mme <u><i>#{@lastname}</i></u>,<br><br>
          Votre enregistrement a bien été pris en compte.<br><br>
          Nous vous invitons le <strong>8 juin 1964</strong>, à <strong>10h00</strong>, au <strong>Palais d’Exposition Centrale</strong>,
          pour assister à l’ouverture officielle du <i>Salon des Technologies du Futur</i>.<br><br>
          Vous aurez l’occasion de découvrir en avant-première les dispositifs expérimentaux présentés cette année,
          ainsi que les démonstrations exclusives réservées aux premiers inscrits.<br><br>
          Nous vous remercions pour votre intérêt et avons hâte de vous accueillir lors de cette journée exceptionnelle.<br><br>
          L’équipe du Salon des Technologies du Futur
          ").result

          user_email = "#{@user_email}"

          message = <<~MESSAGE_END
            From: Salon des Technologies du Futur <#{gmail_user}>
            To: Invité <#{user_email}>
            Subject: #{subject}
            MIME-Version: 1.0
            Content-type: text/html

            #{body}
          MESSAGE_END

          Net::SMTP.start('smtp.gmail.com', 587, 'localhost', gmail_user, gmail_password, :login) do |smtp|
            smtp.send_message(message, gmail_user, user_email)

            @message = "Mail envoyé avec succès !"
          end
        rescue Exception => e
          @message = "Erreur : #{e.message}"
        end
      else
        @message = "L'adresse email doit être un email <u>gmail.com</u>, <u>campus-eni.fr</u>, <u>proton.me</u> ou <u>yopmail.com</u>.<br>L'adresse mail ne doit pas commencer par <u>stf</u>"
      end
    else
      @message = "Les informations firstname, lastname et email sont requises."
    end

    response.body = @message
  end

end

# Démarrage du serveur WEBrick sur /send_email
server = WEBrick::HTTPServer.new(Port: 666, BindAddress: '0.0.0.0')

# Masquer la technologie dans les headers
server.config[:ServerSoftware] = 'Mystere et boule de gomme'

server.mount('/', WEBrick::HTTPServlet::FileHandler, PUBLIC_ROOT, {
  FancyIndexing: true
})
server.mount('/send_email', SimpleServlet)

trap('INT') { server.shutdown }
server.start
