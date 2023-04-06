Profile: OsservazioneRL 
Parent: Observation
Id: ObservationRL
Title:    "Observation - Referto di Laboratorio"
Description: "Descrive come rappresentare la risorsa Observation per le rilevazioni cliniche del referto di laboratorio."

* obeys ita-lab-1
* code from risultato-osservazione (preferred)
* code ^short = "Codice dell'osservazione."
* status from $observation-status (required)
* status ^short = "	registered | preliminary | final | amended +\nStato dell'osservazione."
* category ^slicing.discriminator.type = #pattern
* category ^slicing.discriminator.path = "$this"
* category ^slicing.rules = #open
* category ^short = "Codice che classifica il tipo di osservazione (laboratory)."
* category contains esame-laboratorio 1..1 MS
* category[esame-laboratorio] = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* category[esame-laboratorio].coding.system ^short = "Terminologia utilizzata."
* category[esame-laboratorio].coding.code ^short = "Codice della categoria."
* subject 1..1
* subject only Reference(PatientRL)
* subject ^short = "Soggetto dell'osservazione."
* encounter 1..1
* encounter only Reference(EncounterRL)
* encounter ^short = "Contesto in cui è stata prodotta l'osservazione."

* performer 1.. MS
* performer ^short = "Soggetto responsabile dell'osservazione."
* performer only Reference(Practitioner or PatientRL or PractitionerRoleRL or Organization or RelatedPerson or CareTeam)
* value[x] MS
* value[x] ^short = "Risultato dell'osservaizone."
* hasMember only Reference(OsservazioneRL)
* hasMember ^short = "Osservazioni correlate alla risorsa."
* specimen ^short = "Reference al campione su cui si basa l'osservazione."
* specimen MS
* specimen only Reference(SpecimenRL)

Invariant: ita-lab-1
Description: "se  \"hasMember\" non è presente allora Observation deve avere un\" value\""
Severity: #error
Expression: "value.exists() or hasMember.exists()"
