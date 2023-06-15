CREATE TABLE person (
    id SERIAL PRIMARY KEY,
    type TEXT NOT NULL,
    personal_company_code TEXT NOT NULL,
    personal_company_code_country TEXT NOT NULL,
    first_name TEXT,
    surname TEXT,
    legal_name TEXT,
    CONSTRAINT unique_personal_company_code_and_country
    UNIQUE (personal_company_code, personal_company_code_country)
);

CREATE TABLE mandate (
    id SERIAL PRIMARY KEY,
    representee_id INTEGER NOT NULL REFERENCES person(id),
    delegate_id INTEGER NOT NULL REFERENCES person(id),
    role TEXT,
    validity_period_from DATE,
    validity_period_through DATE,
    can_sub_delegate BOOLEAN,
    created_by TEXT,
    original_mandate_id INTEGER REFERENCES mandate(id),
    deleted BOOLEAN,
    CONSTRAINT fk_mandate_delegate FOREIGN KEY (delegate_id) REFERENCES person (id),
    CONSTRAINT fk_mandate_representee FOREIGN KEY (representee_id) REFERENCES person (id)
);