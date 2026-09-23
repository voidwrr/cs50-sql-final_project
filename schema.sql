CREATE TABLE "ages" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "start_year" INTEGER NOT NULL,
    "end_year" INTEGER,
    "description" TEXT,
    PRIMARY KEY("id")
);

CREATE TABLE "campaigns" (
    "id" INTEGER,
    "title" TEXT NOT NULL,
    "age_id" INTEGER,
    "description" TEXT,
    "start_date" DATE DEFAULT(CURRENT DATE) NOT NULL,
    "end_date" DATE,
    PRIMARY KEY("id"),
    FOREIGN KEY("age_id") REFERENCES "ages"("id")
);
