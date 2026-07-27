# Protocollo Knowledge-Ops Rhei — v2.0 (template)

> Modello riusabile per far lavorare più persone allo stesso progetto in modo asincrono,
> senza ripartire da zero e senza ridondanze. Questo repo è un TEMPLATE: clonalo per un nuovo progetto.
> Consolida le scoperte del pilota (v1.3) e l'evoluzione emersa in riunione (assunzioni + direzione alert).

---

## 1. Principio

> **La memoria del progetto vive nei file versionati, non nelle memorie private dei Claude.**

Ciò che si scambia tra le persone non sono i documenti, ma i **presupposti**: le poche affermazioni su
cui il lavoro poggia e che, se cambiano, fanno cambiare il lavoro di qualcun altro. I documenti restano
dove sono; nel repo vivono stato, decisioni, presupposti e handoff.

## 2. Ruoli
- **Contributore** — possiede uno o più filoni, ci ragiona nella propria chat, deposita presupposti e handoff.
- **Orchestratore** — un solo contributore che fa anche da consolidatore (unico a girare il Cowork che riconcilia).
- **Owner della Discovery** — un solo contributore che conduce la fase iniziale finché i filoni non sono definiti.
(La definizione operativa dei diritti/doveri di ciascun ruolo è in RUOLI.md.)

## 3. Le due vite del progetto: Discovery → Multiplayer
- **Discovery** (sequenziale, una voce sola): i filoni non esistono, si definiscono. Parallelizzare qui CREA ridondanze.
- **Multiplayer** (parallelo): filoni definiti con proprietario. Il passaggio è una decisione esplicita in STATO_LAVORI.md.
Un **filone** è un flusso di lavoro autonomo (il "cosa"); il **proprietario** è chi ne è responsabile (il "chi").

## 4. Architettura — tre utensili, tre lavori (verificato nel pilota)
- **Lettura dello stato** → Claude Code sul clone locale (i file sono lì, sempre freschi). In alternativa, allegare lo stato alla chat.
- **Scrittura + versionamento** → Claude Code (unico che chiude append + commit + push). Il connettore GitHub nativo è SOLA LETTURA; Cowork scrive in locale ma non pusha dalla sandbox.
- **Consolidamento / knowledge-work** → Cowork.
- **git** è la spina dorsale di sincronizzazione tra le persone e tra gli utensili locali.
- Il connettore GitHub-in-lettura NON è un pilastro (e sui progetti Team richiede l'abilitazione di un Owner).

## 5. I file del repo
```
/progetto
├── 00_guida/               # linee guida durevoli (sola lettura)
├── 10_lavori_in_corso/     # bozze e materiali di sessione
├── 20_deliverable/         # output consolidati
├── .github/workflows/      # Actions (validazione handoff, notifica opzionale)
├── STATO_LAVORI.md         # stato: fase / deciso / aperto / prossimo passo
├── PRESUPPOSTI.md          # registro dei presupposti (ponte verso gli alert)
├── LAVORI_IN_CORSO.md      # bacheca claim
├── RUOLI.md                # definizione operativa dei ruoli
├── SETUP.md                # come avviare un progetto da questo template
├── sync.sh                 # rituale git + guardia handoff
└── README.md               # questo protocollo
```

## 6. Ciclo di sessione
1. `./sync.sh start` → pull + stato corrente (o Claude Code sul clone).
2. Claim del pezzo nel proprio filone (bacheca), prima di lavorare.
3. Ragiona nella chat consulente → decisione + brief.
4. Scrivi l'handoff (schema §7) via Claude Code; aggiorna PRESUPPOSTI.md se ne emergono/cambiano.
5. `./sync.sh end "messaggio"` → guardia handoff + commit + push.
6. Consolidamento periodico (orchestratore): Cowork riconcilia → 20_deliverable/.

## 7. Schema handoff (append in coda a STATO_LAVORI.md)
```
### Handoff — {AAAA-MM-GG} · {persona} · filone {A|B|...}
- Fatto: artefatti prodotti o output verificabili
- Assunzioni: presupposti su cui poggia (con ID P-nn se già in PRESUPPOSTI.md) (oppure "nessuna")
- Deciso: scelte con motivo che vincolano il seguito (oppure "nessuna")
- Aperto: questioni che condizionano il prossimo passo, ciascuna con owner (oppure "nessuna")
- Prossimo passo: azione concreta eseguibile · owner: {persona}
- File toccati: elenco file modificati (oppure "nessuno")
```
Un'Action (filone A) verifica la FORMA di queste sei etichette, non la qualità.

## 8. Gestione delle sovrapposizioni
- Sequenzialità in Discovery (il protocollo).
- Collisione dura sullo stesso file → git (merge).
- Ridondanza soft tra file → consolidatore Cowork (a valle).
- Prevenzione → bacheca claim + filoni con proprietario.

## 9. Il modello a oggetti (direzione, non ancora implementato)
Sei oggetti: persone, filoni, decisioni, ASSUNZIONI, questioni aperte, artefatti.
Tre layer: somma (STATO_LAVORI) · delta (storia git) · INCROCIO (motore di alert — v2.x).
Il **motore di incrocio** — che segnala quando una decisione chiude una questione o invalida un presupposto
di un altro filone — è la frontiera successiva. Prototipo economico disponibile subito: il consolidatore
Cowork che segnala "⚠️ Da riconciliare" on-demand. Da validare (utile o rumore?) PRIMA di automatizzarlo.

## 10. Limiti noti
- Connettore GitHub: sola lettura; scrittura via Claude Code/Cowork.
- La qualità di "Prossimo passo" e dei presupposti non è validabile da un'Action (solo la forma).
- L'affidabilità dipende dalla disciplina di handoff, non dalla tecnologia.

## 11. Avvio
Vedi SETUP.md.
