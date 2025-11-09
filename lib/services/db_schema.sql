BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "Resenas" (
	"ResenaID"	INTEGER,
	"FechaCreacion"	TEXT NOT NULL DEFAULT (datetime('now')),
	"UsuarioID"	INTEGER NOT NULL,
	"PeliculaNombre"	TEXT NOT NULL,
	"TituloResena"	TEXT NOT NULL,
	"ContenidoResena"	TEXT NOT NULL,
	"Calificacion"	INTEGER NOT NULL CHECK("Calificacion" >= 1 AND "Calificacion" <= 5),
	"ImagenURL"	TEXT,
	PRIMARY KEY("ResenaID" AUTOINCREMENT),
	FOREIGN KEY("UsuarioID") REFERENCES "Usuarios"("UsuarioID") ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS "Usuarios" (
	"UsuarioID"	INTEGER,
	"Email"	TEXT NOT NULL UNIQUE,
	"PasswordHash"	TEXT NOT NULL,
	PRIMARY KEY("UsuarioID" AUTOINCREMENT)
);
COMMIT;
