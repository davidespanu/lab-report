Profile: DiagnosticReportRL
Parent: DiagnosticReport
Id: DiagnosticReportRL
Title: "DiagnosticReport - Referto di Laboratorio"
Description: "Descrizione della risorsa DiagnosticReport per la descrizione delle informazioni cliniche del referto di laboratorio."

* obeys performer-rule
* ^publisher = "HL7 Italia"
* ^copyright = "HL7 Italia"
* . ^short = "DiagnosticReport Referto di Laboratorio"
* . ^definition = "Laboratory Report DiagnosticReport"

* basedOn only Reference (ServiceRequestRL)
* basedOn ^short = "Reference a una o più prestazioni richieste associate al referto."
* category 1.. 
* category ^short = "Categoria del servizio."
* category from $diagnosticreport-category (example)
* category ^definition = "Un codice che classifica la disciplina clinica, il reparto o il servizio diagnostico che ha creato il referto (es. cardiologia, biochimica, ematologia)."

* subject 1..
* subject ^short = "Soggetto del referto."
* subject.type 1..
* subject.identifier 1..
* subject.type = "Patient"
* subject.identifier ^short = "Identificativo univoco del soggetto."
* subject.reference 0..0

* status ^short = "registered | partial | preliminary | modified | final | amended | corrected | appended | cancelled | entered-in-error | unknown \r\n Stato del report clinico."
* status from $diagn-status (required)
* encounter only Reference (EncounterRL) 
* encounter ^short = "Evento sanitario che ha portato alla creazione del DiagnosticReport"
* specimen only Reference (SpecimenRL)
* specimen ^short = "Reference ai campioni su cui si basa DiagnosticReport."
* performer ^short = "Responsabile del report clinico."
* performer ^definition = "Organizzazione o Persona che è responsabile del report; non è necessariamente l'autore dei dati atomici o l'entità che ha interpretato i risultati. "
* code = $LOINC#11502-2 "Referto di medicina di laboratorio"
* result only Reference (ObservationRL)
* result ^short = "Osservazioni cliniche del referto." 
* imagingStudy 0..0 

Invariant: performer-rule
Description: "Practitioner-PractitionerRole-Organization-CareTeam gestione reference"
Severity: #error
Expression: "((performer.type='Practitioner' or performer.type='Organization') and performer.reference.exists().not()) or (performer.type.exists().not() and (performer.reference.contains('PractitionerRole') or performer.reference.contains('CareTeam')))"