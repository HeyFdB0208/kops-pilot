# Retro — rodaggio filone A (giro in solitaria)

> Data: 2026-07-24 · FdB
> Contesto: primo giro del pilota Knowledge-Ops, filone A (Automazione & infrastruttura),
> eseguito da solo per rodare il meccanismo prima del lavoro parallelo con Graziano.

## Cosa ha funzionato
- **Lettura dello stato in chat**: il connettore GitHub nativo legge STATO_LAVORI.md,
  LAVORI_IN_CORSO.md e README.md. La chat si allinea allo stato corrente senza allegare a mano.
- **Ragionamento nel consulente**: la prima sessione (Discovery-lite) ha confermato i filoni
  e ha individuato da sola la dipendenza A↔B sul contratto di handoff. Il consulente aggiunge valore, non solo esegue.
- **Scrittura del file via Cowork**: append a STATO_LAVORI.md corretto, con **append-only rispettato**
  (solo la riga giusta, resto del file intatto).

## Attriti emersi (i due dati veri del test)
1. **Il connettore non scrive.** Il connettore GitHub nativo è in sola lettura.
   La scrittura dell'handoff NON passa dalla chat → serve Cowork / Claude Code / commit umano.
   → Cade l'assunzione "la chat scrive via connettore" della v1.x. (già a verbale in STATO_LAVORI, riflessa in protocollo v1.3)
2. **Cowork scrive ma non pusha.** Dalla sandbox di Cowork il `git push` fallisce
   (HTTP 403 dal proxy verso github.com). Commit locale ok, ultimo miglio verso GitHub manuale.
   → Il "flusso automatico" è hands-free in lettura, ma la scrittura resta un passo esplicito, e il push oggi è manuale.

## Ipotesi da verificare (NON ancora un fatto)
- **Claude Code per la scrittura del filone A.** Gira nel terminale reale, con credenziali e rete
  dell'utente → dovrebbe fare append + commit + push senza il blocco della sandbox.
  Da testare al prossimo giro prima di darlo per buono (lezione del pilota: non dare per scontato ciò che non si è provato).

## Ripartizione degli utensili — come si sta chiarendo sul campo
- **Connettore nativo** → lettura dello stato in chat.
- **Claude Code** (da verificare) → scrittura + versionamento per chi lavora dentro il repo (filone A).
- **Cowork** → consolidamento e knowledge-work non git-nativa (deliverable, documenti);
  qui il push bloccato non è un problema perché l'output è un file da versionare a parte.

## Limite del test finora (onesto)
Tutto validato **in solitaria**: è validato l'impianto tecnico (lettura/scrittura/push),
NON il cuore del protocollo (due persone in parallelo, claim, handoff che passa tra le persone).
La promessa "lavorare a più mani senza ripartire da zero" si verifica solo con Graziano dentro.

## Prossimi passi proposti
- [ ] Testare Claude Code sul push (chiude l'attrito 2?)
- [ ] Coinvolgere Graziano per il primo giro davvero parallelo (stressa claim + handoff tra persone)
- [ ] In base agli esiti: aggiornare il protocollo a v1.4 con la ripartizione utensili definitiva

---

## Aggiornamento — 2026-07-24, test Claude Code (ipotesi confermata)

**Esito: Claude Code chiude il cerchio.** Append + commit + push riusciti fino a origin/main,
senza il 403 che bloccava Cowork. L'ipotesi della retro è confermata: è un FATTO, non più un'ipotesi.

**Sfumatura importante:** Claude Code non ha fatto un push banale. Ha risolto problemi git reali —
switch da HTTPS a SSH (mancavano le credenziali HTTPS in sessione), history divergente gestita con
`git pull --rebase`, verifica di identità dei file prima di toccarli. Quindi non è "Cowork che pusha":
è uno strumento che **opera dentro git con competenza**, gestendo situazioni precluse a Cowork (sandbox) e alla chat.

**Ripartizione utensili — ora consolidata dal test:**
- **Connettore nativo** → lettura dello stato in chat (sola lettura).
- **Claude Code** → scrittura + versionamento per i filoni git-centrici (come A). Percorso di scrittura CONFERMATO.
- **Cowork** → consolidamento e knowledge-work non git-nativa (deliverable, documenti). Utile ma non pusha dalla sandbox.

**Decisioni tecniche prese:**
- Remote `origin` impostato su SSH (chiave id_ed25519). Scelta stabile, mantenuta.
- Aggiunto `.gitignore` (macOS + Windows + editor) per tenere pulito il repo condiviso prima dell'ingresso di Graziano.

**Attriti residui:** nessuno bloccante sul percorso Claude Code. Cowork resta con push bloccato + lock residui,
ma non è più il percorso di scrittura per A.

## Prossimi passi (aggiornati)
- [x] Testare Claude Code sul push → CONFERMATO
- [ ] Coinvolgere Graziano per il primo giro davvero parallelo (stressa claim + handoff tra persone)
- [ ] Aggiornare il protocollo a v1.4 con la ripartizione utensili definitiva (connettore=lettura, Claude Code=scrittura repo, Cowork=consolidamento)
