# Presupposti operativi — {NOME PROGETTO}

> Registro dei presupposti: le poche affermazioni su cui il lavoro poggia e che,
> se cambiassero, farebbero cambiare il lavoro di qualcuno.
> NON sono i documenti (quelli restano dove sono): sono ciò che conta per l'allineamento.
>
> Perché è un file a sé: i presupposti sono l'oggetto su cui, in futuro, il motore di
> incrocio genererà gli alert. Tenerli separati e tipizzati li rende collegabili domani.

## Come si scrive un presupposto
Una riga breve, verificabile, con owner e stato. Formato:

`- [P-nn] {affermazione} · filone: {A|B|...} · owner: {persona} · stato: {attivo|invalidato} · dal: {AAAA-MM-GG}`

Esempi (da cancellare all'avvio):
- [P-01] Il prezzo si calcola per postazione, non a consumo · filone: A · owner: {persona} · stato: attivo · dal: {AAAA-MM-GG}
- [P-02] Lo strumento X è il riferimento ufficiale del progetto · filone: B · owner: {persona} · stato: attivo · dal: {AAAA-MM-GG}

## Regole
- Un presupposto invalidato NON si cancella: si marca `stato: invalidato` e si annota chi/quando (traccia il delta).
- Se una decisione invalida un presupposto di un altro filone, va segnalato nell'handoff (campo Assunzioni) e all'owner.
- ID incrementale `P-nn`: serve a puntare al presupposto dagli handoff senza riscriverlo.

## Presupposti attivi
_(vuoto all'avvio)_

## Presupposti invalidati (storico)
_(vuoto all'avvio)_
