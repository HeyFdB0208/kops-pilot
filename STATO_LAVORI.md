# Stato lavori — Knowledge-Ops Rhei (pilota)

> Ultimo aggiornamento: 2026-07-24 · FdB
> Protocollo di riferimento: Knowledge-Ops Rhei v1.2 (README.md)
> **Fase corrente: MULTIPLAYER** — filoni A e B confermati e attivi in parallelo

## Fase
- [x] Discovery — completata (2026-07-24): obiettivi e filoni confermati
- [x] Multiplayer — aperta (2026-07-24): filoni A e B in parallelo

## Deciso
- Adottato il Protocollo Knowledge-Ops Rhei v1.2 · FdB, 2026-07-24
- Progetto pilota autoreferenziale: si testa il protocollo costruendo il protocollo · FdB, 2026-07-24
- Contributori: FdB (orchestratore/consolidatore), Graziano Greco · FdB, 2026-07-24
- Avvio in bootstrap manuale; poi attivazione del connettore GitHub e delle Actions · FdB, 2026-07-24
- Confermati i filoni A (Automazione & infrastruttura, owner FdB) e B (Protocollo & casi d'uso, owner Graziano Greco) · FdB, 2026-07-24
- Il contratto di handoff è l'interfaccia tra A e B: B fissa la struttura minima, A ci costruisce la validazione · FdB, 2026-07-24

## Aperto
- Struttura minima dell'handoff — da fissare in B prima che A congeli l'Action di validazione
- Cadenza del consolidamento — proposta: a fine test
- Canale di notifica — opzionale, per ora omesso

## Filoni
I filoni vivi e i pezzi in corso stanno nella bacheca: vedi `LAVORI_IN_CORSO.md`.

## Prossimo passo
- FdB (A): dichiara il primo pezzo sulla bacheca — repo + connettore GitHub — e avvia.
- Graziano (B): dichiara il primo pezzo — struttura minima dell'handoff — così da sbloccare la validazione di A.

## Log sessioni
- 2026-07-24 FdB: inizializzato il pilota, adottato protocollo v1.2, proposti i filoni A/B.
- 2026-07-24 FdB: chiusa la Discovery, confermati i filoni A/B, aperto il Multiplayer.
- 2026-07-24 FdB: test di scrittura handoff via Cowork — verifica del flusso di scrittura/commit/push.
- 2026-07-24 FdB: test di scrittura via Claude Code — verifica append + commit + push.

## Deciso (append — 2026-07-24, sessione filone B: schema handoff)
- CONGELATO lo schema minimo dell'handoff (validato col /devil). Cinque campi sempre presenti, sentinella esplicita dove vuoto, owner del prossimo passo reso frammento riconoscibile. · FdB, 2026-07-24

### Schema handoff (contratto A↔B)
### Handoff — {AAAA-MM-GG} · {persona} · filone {A|B|...}
- Fatto: artefatti prodotti o output verificabili in questa sessione
- Deciso: scelte con motivo che vincolano il seguito (oppure "nessuna")
- Aperto: questioni che condizionano il prossimo passo, ciascuna con owner (oppure "nessuna")
- Prossimo passo: azione concreta eseguibile · owner: {persona}
- File toccati: elenco dei file modificati (oppure "nessuno")

Campi che l'Action (filone A) dovrà verificare — solo la FORMA, non la qualità:
- intestazione ben formata: "### Handoff — ", data ISO, persona, filone ammesso
- presenza di tutte e cinque le etichette, nell'ordine
- ogni campo non vuoto (contenuto reale o sentinella ammessa)
- nel "Prossimo passo", presenza di "owner:" seguito da un nome

## Aperto (append — 2026-07-24)
- ARCHITETTURA: file unico STATO_LAVORI vs file-per-filone per l'append. Con file unico i conflitti di merge in scrittura concorrente sono strutturali; lo schema a blocchi li rende innocui ma non li previene. Scelta che tocca il filone A — da decidere insieme.
- La qualità del "Prossimo passo" non è validabile da nessuna Action (solo la forma). Serve un presidio umano, non una regola.

## Log sessioni (append)
- 2026-07-24 FdB: congelato lo schema di handoff (contratto A↔B), messe a verbale le due obiezioni aperte.

cat >> STATO_LAVORI.md << 'EOF'

## Deciso (append — 2026-07-24, esito riunione FdB × Graziano)
- Il modello a filoni è stato formalizzato da Graziano in SEI oggetti: persone, filoni, decisioni, ASSUNZIONI, questioni aperte, artefatti. Cinque erano già nel pilota; le assunzioni sono il pezzo mancante. · 2026-07-24
- Aggiunto il campo "Assunzioni" allo schema di handoff (vedi schema v2 sotto). Motivo: senza assunzioni tracciate, il futuro motore di incrocio non può segnalare quando una decisione ne invalida una di un altro filone. · 2026-07-24
- I tre layer di aggregazione: somma (STATO_LAVORI) e delta (storia git) esistono già; l'INCROCIO (motore proattivo che genera alert tra filoni) è la direzione v2.0, da progettare DOPO il primo giro reale a due. · 2026-07-24
- Chiarimento sull'esperimento di Graziano: lo stato e l'eventuale grafo vivono nel REPO (o in un DB), letti/scritti dagli utensili (Claude Code, Cowork). NON si scrive "dentro le chat" — limite già verificato. · 2026-07-24

### Schema handoff v2 (supersede la v1 — aggiunge Assunzioni)
### Handoff — {AAAA-MM-GG} · {persona} · filone {A|B|...}
- Fatto: artefatti prodotti o output verificabili in questa sessione
- Assunzioni: basi su cui poggia il lavoro di questa sessione (oppure "nessuna")
- Deciso: scelte con motivo che vincolano il seguito (oppure "nessuna")
- Aperto: questioni che condizionano il prossimo passo, ciascuna con owner (oppure "nessuna")
- Prossimo passo: azione concreta eseguibile · owner: {persona}
- File toccati: elenco dei file modificati (oppure "nessuno")

Campi che l'Action (filone A) verifica — ora SEI etichette, nell'ordine; forma non qualità.

## Aperto (append — 2026-07-24)
- v2.0: motore di incrocio (grafo) che genera alert tra filoni — da progettare dopo il giro a due.
- Prototipo economico dell'incrocio: il consolidatore Cowork ("⚠️ Da riconciliare") è già una versione manuale. Provarlo prima di costruire il grafo.

## Log sessioni (append)
- 2026-07-24 FdB+Graziano: riunione di allineamento. Modello a sei oggetti, schema handoff v2 (+Assunzioni), direzione v2.0 (motore incrocio) messa a verbale.
EOF
