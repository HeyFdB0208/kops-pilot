# Indicazioni per il test — Knowledge-Ops Rhei (pilota)

Guida passo-passo per far girare il pilota con FdB e Graziano.
Prima si valida il protocollo a mano (bootstrap), poi si accende l'automazione.

## Passo 1 — Repo
1. Crea un repo GitHub privato `kops-pilot`.
2. Committa questo intero contenuto (README.md = protocollo, i tre file di controllo, le cartelle).
3. Aggiungi Graziano come collaboratore del repo.

## Passo 2 — Progetto Claude condiviso
1. Su Claude Team crea il progetto **"Knowledge-Ops Rhei"**.
2. Incolla `ISTRUZIONI_PROGETTO.md` nelle *istruzioni di progetto*.
3. NON caricare STATO_LAVORI come documento (vive nel repo).
4. Condividi il progetto con Graziano Greco.

## Passo 3 — Prima sessione (FdB) — Discovery-lite
Obiettivo: confermare i filoni e aprire il Multiplayer.
1. Apri una chat nel progetto.
2. Allega `STATO_LAVORI.md` e `LAVORI_IN_CORSO.md` (bootstrap manuale) e chiedi: "leggi e allineati".
3. Conferma (o correggi) i filoni A e B. Spostali nel blocco `Deciso` di STATO_LAVORI.
4. Popola la bacheca con i due filoni e i proprietari. Rimuovi la riga "Discovery".
5. Commit + push. Il progetto è ora in Multiplayer.

## Passo 4 — Sessione parallela di test (il cuore del test)
FdB e Graziano lavorano IN PARALLELO su filoni diversi.
- **FdB (filone A):** apri la tua chat nel progetto, allega lo stato, dichiara il tuo
  pezzo nella bacheca (es. "bozza workflow Actions"), lavora, a fine sessione scrivi
  l'handoff in STATO_LAVORI, commit + push.
- **Graziano (filone B):** stessa cosa sul suo pezzo (es. "scenari d'uso del protocollo").
- Regola: nessuno tocca il pezzo dell'altro. La bacheca è il lock.

## Passo 5 — Consolidamento (FdB, Cowork)
1. `git pull`.
2. Nel Cowork consolidatore, incolla il prompt-integratore (README §10).
3. Leggi per primi i blocchi "⚠️ Da riconciliare" e "❓ Da chiarire".
4. Salva il deliverable in `20_deliverable/`, aggiorna STATO_LAVORI, commit + push.

## Passo 6 — Retro (5 minuti)
Una sola domanda: **dov'è saltata la disciplina di handoff?**
Annota la risposta in `10_lavori_in_corso/retro.md`. È il vero output del test.

## Passo 7 — Accendi il bus (seconda iterazione)
1. (Owner) Aggiungi il connettore GitHub su Team; tu e Graziano vi collegate.
2. Verifica cosa il connettore consente di scrivere e limita i permessi.
3. Rifai un ciclo SENZA allegare a mano: la chat legge/scrive il repo da sola.
4. Confronta l'attrito con il bootstrap: è questo il guadagno dell'automazione.

## Comandi git (bootstrap)
```
git pull
git add . && git commit -m "handoff: <pezzo>"
git push
```
