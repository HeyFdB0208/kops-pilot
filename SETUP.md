# Setup — avviare un progetto da questo template

## 0. Crea il repo dal template
Su GitHub: apri il repo template → "Use this template" → "Create a new repository" → nome del progetto, Private.
(In alternativa: clona e ricrea la history.)

## 1. Personalizza i segnaposto
Sostituisci `{NOME PROGETTO}`, `{persona}`, `{AAAA-MM-GG}` in:
- README.md (intestazione)
- STATO_LAVORI.md · LAVORI_IN_CORSO.md · PRESUPPOSTI.md · RUOLI.md
Cancella gli esempi marcati "da cancellare all'avvio" in PRESUPPOSTI.md.

## 2. Progetto Claude condiviso (Team)
- Crea il progetto omonimo; incolla le istruzioni durevoli (vedi 00_guida/ o il tuo standard).
- NON caricare STATO_LAVORI/PRESUPPOSTI come documenti: vivono nel repo.
- Condividi con i contributori.

## 3. Utensili
- Ogni contributore clona il repo in locale.
- Scrittura/versionamento: Claude Code (chiude append+commit+push).
- Consolidamento: Cowork (solo orchestratore).
- Lettura in chat: allega STATO_LAVORI/PRESUPPOSTI quando serve un consulto.

## 4. Ruoli
Compila la sezione finale di RUOLI.md: contributori, orchestratore, owner Discovery.

## 5. Discovery → Multiplayer
- Parti in Discovery (un proprietario, sequenziale): assessment, poi definisci i filoni.
- Registra i filoni nel blocco Deciso di STATO_LAVORI.md e popola la bacheca → apri il Multiplayer.

## 6. Rituale di sessione
```
chmod +x sync.sh        # una volta
./sync.sh start         # inizio: pull + stato
./sync.sh end "msg"     # fine: guardia handoff + commit + push
```

## Nota beta
Il motore di incrocio/alert NON è incluso: è la frontiera v2.x, da costruire dopo il primo giro reale a due.
Prototipo intanto: consolidatore Cowork on-demand ("⚠️ Da riconciliare").
