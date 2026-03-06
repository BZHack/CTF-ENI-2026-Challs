const express = require("express");
const { ApolloServer, gql } = require("apollo-server-express");
const crypto = require("crypto");

const app = express();

/* ================= SCHEMA ================= */

const typeDefs = gql`
  type Query {
    users: [Users]
    user(id: ID!): User
    auditLogs: [AuditLog]
    systemInfo: SystemInfo
    me: UserMe
  }

  type Mutation {
    login(username: String!, passwordHash: String!): AuthPayload
  }

  type AuthPayload {
    token: String
    user: User
  }

  type Users {
    id: ID!
    username: String!
    email: String!
    role: String!
    createdAt: String!
    profile: Profile
    lastSessions: [Sessions]
  }

  type User {
    id: ID!
    username: String!
    email: String!
    role: String!
    createdAt: String!
    profile: Profile
    lastSessions: [Sessions]
    secret: Secret
  }

  type Secret {
    passwordHash: String
  }

  type UserMe {
    id: ID!
    username: String!
    email: String!
    role: String!
    createdAt: String!
    lastLogin: String
    profile: Profile
    lastSessions: [Sessions]
    notes: [Note]
  }

  type Note {
    id: ID!
    content: String!
    createdAt: String!
  }

  type Profile {
    firstName: String
    lastName: String
    phone: String
    address: String
    department: String
    jobTitle: String
  }

  type Sessions {
    id: ID!
    ip: String!
    userAgent: String!
    createdAt: String!
  }

  type AuditLog {
    id: ID!
    action: String!
    actor: String!
    target: String
    timestamp: String!
    sourceIp: String
  }

  type SystemInfo {
    version: String
    build: String
    environment: String
    region: String
  }
`;

/* ================= DATA ================= */

const users = [
  {
    id: "73f38593-e398-44cf-a21c-c14e26454707",
    username: "julien.moreau",
    email: "julien.moreau@intracorp.local",
    role: "developer",
    createdAt: "2023-04-12",
    secret: {
      passwordHash: crypto
        .createHash("sha512")
        .update("PasswOrd123!CTF-ENI!")
        .digest("hex"),
    },
    profile: {
      firstName: "Julien",
      lastName: "Moreau",
      phone: "+33624587963",
      address: "18 Rue de la République, Lyon",
      department: "Engineering",
      jobTitle: "Backend Developer",
    },
    lastSessions: [
      {
        id: "17d5b1da-b598-4ad4-bbd9-7efceeedc91b",
        ip: "10.32.14.22",
        userAgent: "Mozilla/5.0 (Macintosh)",
        createdAt: "2026-02-08T17:25:32Z",
      },
      {
        id: "9df58be3-36e9-4e77-b64c-944ad3cef84e",
        ip: "10.32.14.22",
        userAgent: "Mozilla/5.0 (Macintosh)",
        createdAt: "2026-02-11T08:42:03Z",
      },
    ],
    note: [],
  },
  {
    id: "5840c9ac-81c9-4a45-ba83-a98ffb483de0",
    username: "claire.robert",
    email: "claire.robert@intracorp.local",
    role: "finance",
    createdAt: "2022-09-03",
    secret: {
      passwordHash: crypto
        .createHash("sha512")
        .update("Rand0mP@ss!CTF")
        .digest("hex"),
    },
    profile: {
      firstName: "Claire",
      lastName: "Robert",
      phone: "+33699887766",
      address: "3 Avenue Foch, Paris",
      department: "Finance",
      jobTitle: "Financial Controller",
    },
    lastSessions: [
      {
        id: "cb7bcb8f-c91c-458d-b1c5-c7d1b78d3b1b",
        ip: "10.32.9.4",
        userAgent: "Mozilla/5.0 (Windows NT 10.0)",
        createdAt: "2026-02-10T17:15:53Z",
      },
    ],
    note: [],
  },
  {
    id: "1efddc68-c890-4931-8aab-20b0e4fb3892",
    username: "admin",
    email: "admin@intracorp.local",
    role: "admin",
    createdAt: "2021-01-15",
    lastLogin: "2026-02-11T06:00:00Z",
    secret: {
      passwordHash: crypto
        .createHash("sha512")
        .update("Passw0rd-CTF-ENI-2026@!")
        .digest("hex"),
    },
    profile: {
      firstName: "Service",
      lastName: "Account",
      phone: "+33123456789",
      address: "Datacenter - Paris DC1",
      department: "Security",
      jobTitle: "Infrastructure Administrator",
    },
    lastSessions: [
      {
        id: "ef43f7b1-1dba-451d-9230-2d2913789fa2",
        ip: "127.0.0.1",
        userAgent: "Mozilla/5.0 (Windows NT 10.0)",
        createdAt: "2026-02-11T06:00:00Z",
      },
    ],
    notes: [
      {
        id: "note-001",
        content: "ENI{Gr4phQL_IntrOspection_1s_N1111c3}",
        createdAt: "2026-02-15T19:17:04Z",
      },
    ],
  },
  {
    id: "a9c1f2e4-5d8b-4f77-9a6c-3f1b2e9d8c44",
    username: "thomas.bernard",
    email: "thomas.bernard@intracorp.local",
    role: "hr",
    createdAt: "2021-06-18",
    secret: {
      passwordHash: crypto
        .createHash("sha512")
        .update("HrS3cure!&2026")
        .digest("hex"),
    },
    profile: {
      firstName: "Thomas",
      lastName: "Bernard",
      phone: "+33655443322",
      address: "12 Rue Victor Hugo, Nantes",
      department: "Human Resources",
      jobTitle: "HR Manager",
    },
    lastSessions: [
      {
        id: "c1b2d3e4-f5a6-4789-b012-9f0a1b2c3d4e",
        ip: "10.32.22.15",
        userAgent: "Mozilla/5.0 (Windows NT 10.0; Win64; x64)",
        createdAt: "2026-02-09T09:14:21Z",
      },
      {
        id: "e4d3c2b1-a6f5-4897-b210-1a2b3c4d5e6f",
        ip: "10.32.22.15",
        userAgent: "Mozilla/5.0 (Windows NT 10.0; Win64; x64)",
        createdAt: "2026-02-11T07:58:44Z",
      },
    ],
    notes: [],
  },
];

const auditLogs = [
  {
    id: "log-20260211-01",
    action: "LOGIN_SUCCESS",
    actor: "julien.moreau",
    target: "portal",
    timestamp: "2026-02-11T08:42:00Z",
    sourceIp: "10.32.14.22",
  },
  {
    id: "log-20260211-02",
    action: "API_QUERY",
    actor: "julien.moreau",
    target: "graphql/users",
    timestamp: "2026-02-11T08:44:12Z",
    sourceIp: "10.32.14.22",
  },
  {
    id: "log-20260210-07",
    action: "EXPORT_FINANCIAL_REPORT",
    actor: "claire.robert",
    target: "finance-module",
    timestamp: "2026-02-10T16:20:00Z",
    sourceIp: "10.32.9.4",
  },
  {
    id: "log-20260210-08",
    action: "LOGIN_FAILED",
    actor: "claire.robert",
    target: "portal",
    timestamp: "2026-02-10T16:15:43Z",
    sourceIp: "10.32.9.4",
  },
  {
    id: "log-20260209-12",
    action: "CONFIG_UPDATE",
    actor: "admin",
    target: "authentication-service",
    timestamp: "2026-02-09T11:02:00Z",
    sourceIp: "127.0.0.1",
  },
  {
    id: "log-20260209-13",
    action: "BACKUP_ROTATION",
    actor: "admin",
    target: "prod-backup-archive",
    timestamp: "2026-02-09T11:15:21Z",
    sourceIp: "127.0.0.1",
  },
  {
    id: "log-20260208-04",
    action: "PASSWORD_CHANGE",
    actor: "thomas.bernard",
    target: "account-settings",
    timestamp: "2026-02-08T09:12:55Z",
    sourceIp: "10.32.22.15",
  },
];

/* ================= RESOLVERS ================= */

const resolvers = {
  Query: {
    users: () => users,
    user: (_, { id }) => users.find((u) => u.id === id),
    auditLogs: () => auditLogs,
    systemInfo: () => ({
      version: "5.4.2",
      build: "2026.02.11-prod",
      environment: "production",
      region: "eu-west-3",
    }),
    me: (_, __, { user }) => user || null,
  },
  Mutation: {
    login: (_, { username, passwordHash }) => {
      const user = users.find((u) => u.username === username);
      if (!user) return null;

      if (user.secret && user.secret.passwordHash === passwordHash) {
        const token = crypto.randomBytes(24).toString("hex");

        activeTokens[token] = user.id;

        return {
          token,
          user,
        };
      }
      return null;
    },
  },
};

const activeTokens = {};

/* ================= SERVER ================= */

async function start() {
  const server = new ApolloServer({
    typeDefs,
    resolvers,
    introspection: true,
    context: ({ req }) => {
      const token = req.headers.authorization || null;
      const userId = activeTokens[token];
      const user = users.find((u) => u.id === userId) || null;

      return { user };
    },
  });

  await server.start();
  server.applyMiddleware({ app });

  app.use(express.static("public"));

  app.listen(4000, () => {
    console.log("Server running at http://localhost:4000/graphql");
  });
}

start();
