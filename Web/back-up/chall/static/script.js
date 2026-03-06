async function showDetails(token) {
    const response = await fetch(`/details/${token}`);
    const data = await response.json();

    const modal = document.getElementById('modal');
    const details = document.getElementById('fileDetails');
    const downloadArea = document.getElementById('downloadArea');

    details.innerHTML = `
        <h4>${data.name}</h4>
        <table class="details-table">

            <tr><td>Reperoire</td><td>${data.directory}</td></tr>
            <tr><td>Creation</td><td>${data.date_creation}</td></tr>
            <tr><td>Droits</td><td>${data.rights}</td></tr>
            <tr><td>Propriétaire</td><td>${data.owner}</td></tr>
            <tr><td>Groupe</td><td>${data.group}</td></tr>
            <tr><td>Taille</td><td>${data.size}</td></tr>
            <tr><td>Token</td><td class="token">${data.token}</td></tr>
        </table>
    `;

    downloadArea.innerHTML = `
        <button id="downloadBtn" onclick="window.location='/details/${token}/download'">
            Télécharger
        </button>
    `;

    modal.style.display = 'flex';
}

function closeModal() {
    document.getElementById('modal').style.display = 'none';
}
