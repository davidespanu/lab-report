Profile: ServiceRequestRL 
Parent: ServiceRequest
Id: ServiceRequestRL
Title: "ServiceRequest - Referto di Laboratorio"
Description: "Descrive la risorsa ServiceRequest che genera l'incontro del referto di laboratorio."
* ^version = "0.0.1"
* ^status = #draft
* ^experimental = true
* ^date = "2023-03-09T16:43:56.519+01:00"
* ^publisher = "HL7 Italia"
* ^copyright = "HL7 Italia"

* identifier 1..* 
* priority MS 
* priority ^short = "routine | urgent | asap | stat \r\r\n\n Priorità della richiesta."
* priority from http://hl7.org/fhir/ValueSet/request-priority (required)

* subject 1..
* subject ^short = "Soggetto cui si riferisce la richiesta."
* subject.type 1..
* subject.identifier 1..
* subject.type = "Patient"
* subject.identifier ^short = "Identificativo univoco del soggetto."
* subject.reference 0..0

* requisition ^short = "Idenificativo comune a più ServiceRequest autorizzate simultaneamente. Rappresenta l'identificativo univoco della richiesta."
* quantity[x] ^short = "Molteplicità della prestazione."
//* occurrence[x] ^short = "Data di erogazione/pianificazione della richiesta." 
//Aggiungendo la descrizione short in questo modo si perde la struttura di valorizzazione. Capire come inserirla, altrimenti togliere la descrizione.
* authoredOn ^short = "Data di invio della richiesta."
* reasonCode ^short = "Quesito diagnostico associato alla richiesta."
* specimen ^short = "Reference usata solo se il campione cui punta la richiesta è già stato prelevato ed esiste."
* intent ^short = "proposal | plan | directive | order | original-order | reflex-order | filler-order | instance-order | option \r\n Indica lo scopo associato ad una richiesta."
* intent from  $intent-code