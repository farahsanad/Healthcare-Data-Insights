use [Final Project]
SELECT
    -- Visit Info
    V.Date_of_Visit,
    V.Service_Type,
    V.Treatment_Cost,
    V.Medication_Cost,
    V.Follow_Up_Visit_Date,
    V.Patient_Satisfaction_Score,
    V.Emergency_Visit,
    V.Payment_Status,
    V.Discharge_Date,
    V.Admitted_Date,
    V.Room_Type,
    V.Insurance_Coverage,
    V.Room_Charges_daily_rate,

    -- Patient Info
    P.Patient_ID,
    P.Patient_Name,
    P.Gender AS Patient_Gender,
    P.Age AS Patient_Age,
    P.Race,
    C.City,
    C.State,

    -- Diagnosis
    D.Diagnosis,

    -- Procedure
    PR.[Procedure],

    -- Insurance
    I.Insurance_Provider,

    -- Provider
    PV.Provider_Name,
    PV.Gender AS Provider_Gender,
    PV.Nationality,
    PV.Age AS Provider_Age,

    -- Department
    DP.Department

FROM dbo.Visits V

-- Join with Patients
JOIN dbo.Patients P ON V.Patient_ID = P.Patient_ID

-- Join with Cities
LEFT JOIN dbo.Cities C ON P.City_ID = C.City_ID

-- Join with Diagnoses
LEFT JOIN dbo.Diagnoses D ON V.Diagnosis_ID = D.Diagnosis_ID

-- Join with Procedures
LEFT JOIN dbo.Procedures PR ON V.Procedure_ID = PR.Procedure_ID

-- Join with Insurance
LEFT JOIN dbo.Insurance I ON V.Insurance_ID = I.Insurance_ID

-- Join with Providers
LEFT JOIN dbo.Providers PV ON V.Provider_ID = PV.Provider_ID

-- Join with Departments
LEFT JOIN dbo.Departments DP ON V.Department_ID = DP.Department_ID;
