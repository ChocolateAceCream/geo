db = db.getSiblingDB('admin');

// Update the root user to have dbAdmin and dbOwner roles
db.updateUser('root', {
  roles: [
    { role: "dbAdmin", db: "admin" },
    { role: "dbOwner", db: "admin" }
  ]
});