# poc-database-schemas-as-code

This POC explores different tools for a SQL database schema versioning in a "GitOps" workflow.  
The goal is to identify **which database schema versioning tool fits best for managing schemas as code**.  
Let's have a look at Flyway, Liquibase and sql-migrate.

## Objectives

The POC focuses on the following requirements:

- **Compatibility**: Compatible with SQL DBs
- **Simplicity**: Easy to use and understand
- **Schema versioning as code**: Version control database changes like application code
- **CICD friendly**: Seamless integration into CICD
- **Rollback support**: Ability to revert schema changes
- **Environment parity**: Smooth transition of schemas between dev/prod
- **Open-source**: Needed features should be open-source

## TL;DR

**sql-migrate** stands out as a lightweight, simple, fully open-source, and effective tool for schema versioning.

## Getting Started

### Requirements

This POC requires Docker with the Compose plugin, and Go v1.18 or higher.

### Initialize Development Database

Initialize the development database. Be sure to recreate the database when switching between tools:

```bash
# ⚠️ Force recreate DB before switching between tools
$ docker-compose up -d --force-recreate -V
```

### Switch Between Tools

- Navigate to the tool's directory
```bash
$ cd (flyway | liquibase | sql-migrate)
```

### Running Migrations

For each tool, the following commands are available to check migration status, migrate up, and migrate down.

- Check Migration Status
```bash
$ ./migrate-status.sh
```

- Migrate Up (then check status if needed)
```bash
$ ./migrate-up.sh
```

- Migrate Down (then check status if needed)
```bash
$ ./migrate-down.sh
```

---

## Tool Comparisons

### Flyway

- ✅ Easy Docker integration
- ✅ Support SQL and many other DBs
- ❌ Requires separate "update" and "undo" files for versioning, making it more complex
- ❌ No "migrate down" feature in the community edition
- ❌ Relies on a heavyweight Java environment

### Liquibase

- ✅ Easy Docker integration
- ✅ Support SQL and many other DBs
- ✅ Migrate up and down within a single file
- ✅ Advanced versioning features like preconditions, labels, and tags
- ✅ Supports multiple formats (SQL, JSON, etc.) for writing schema changes
- ❌ "Migrate down" syntax is specific
- ❌ Specific concepts like `changelog` and `changeset`
- ❌ Relies on a heavyweight Java environment

### sql-migrate

- ✅ Simplicity overall
- ✅ Single-file migrations (up and down) using lightweight annotations
- ✅ Limited but effective versioning system
- ✅ Minimal documentation—just a README and a few examples
- ✅ Lightweight Go-based binary
- ❌ Support only SQL DBs
- ❌ No official prebuilt binary or Docker image available

## Insights & Considerations

sql-migrate is used by the [Venom](https://github.com/ovh/venom) CLI for setting up and running integration tests.
Using sql-migrate in production allows you to maintain the same schema in development with venom and take advantage of all its associated features.

## Conclusion

If you're looking for a simple and lightweight solution for SQL DBs, **sql-migrate** is likely your best option. For more complex or advanced use cases, you might want to consider **Liquibase** or do further research.
