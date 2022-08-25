CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- CreateTable
CREATE TABLE "accounts" (
    "acc_id" UUID NOT NULL DEFAULT uuid_generate_v4(),
    "full_name" VARCHAR(120) NOT NULL,
    "email" VARCHAR(180) NOT NULL,
    "password" VARCHAR NOT NULL,
    "gender" VARCHAR(1) NOT NULL,
    "is_admin" BOOLEAN NOT NULL,
    "profile_dir" VARCHAR,

    CONSTRAINT "accounts_pkey" PRIMARY KEY ("acc_id")
);

-- CreateTable
CREATE TABLE "services" (
    "service_id" UUID NOT NULL DEFAULT uuid_generate_v4(),
    "event_name" VARCHAR NOT NULL,
    "starting_date" DATE,
    "ending_date" DATE,
    "venue" VARCHAR(13),
    "sponsor" VARCHAR,
    "level_of_event" VARCHAR,
    "credit_point" INTEGER DEFAULT 0,
    "created_at" DATE NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "service_dir" VARCHAR,
    "teacher_id" UUID NOT NULL,

    CONSTRAINT "services_pkey" PRIMARY KEY ("service_id")
);

-- CreateTable
CREATE TABLE "teachers" (
    "acc_id" UUID NOT NULL DEFAULT uuid_generate_v4(),
    "position" VARCHAR,
    "total_credits" INTEGER DEFAULT 0,

    CONSTRAINT "teachers_pkey" PRIMARY KEY ("acc_id")
);

-- AddForeignKey
ALTER TABLE "services" ADD CONSTRAINT "services_teacher_id_fkey" FOREIGN KEY ("teacher_id") REFERENCES "teachers"("acc_id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "teachers" ADD CONSTRAINT "fk_accounts" FOREIGN KEY ("acc_id") REFERENCES "accounts"("acc_id") ON DELETE CASCADE ON UPDATE NO ACTION;
