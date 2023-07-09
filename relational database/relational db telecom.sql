CREATE TABLE "customer" (
  "customer_id" int PRIMARY KEY,
  "gender" varchar(20),
  "age_brackets" varchar(50)
);

CREATE TABLE "address" (
  "add_id" int PRIMARY KEY,
  "city" varchar(50),
  "state" varchar(50)
);

CREATE TABLE "capabilities" (
  "cap_id" int PRIMARY KEY,
  "num_dependents" int,
  "estimated_salary" int
);

CREATE TABLE "usage_info" (
  "usage_id" int PRIMARY KEY,
  "date_of_regist" date,
  "pincode" int,
  "calls_made" int,
  "sms_made" int,
  "data_usage" int,
  "churn" varchar(5)
);

ALTER TABLE "address" ADD FOREIGN KEY ("add_id") REFERENCES "customer" ("customer_id");

ALTER TABLE "capabilities" ADD FOREIGN KEY ("cap_id") REFERENCES "customer" ("customer_id");

ALTER TABLE "usage_info" ADD FOREIGN KEY ("usage_id") REFERENCES "customer" ("customer_id");
