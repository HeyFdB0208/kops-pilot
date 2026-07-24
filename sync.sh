#!/usr/bin/env bash
# sync.sh — rituale di sincronizzazione Knowledge-Ops
# Uso:
#   ./sync.sh start                 -> pull + mostra lo stato corrente
#   ./sync.sh end "messaggio"       -> commit + push (con guardia sull'handoff)
set -euo pipefail

cmd="${1:-}"

case "$cmd" in
  start)
    echo "→ Sincronizzo dal remoto..."
    git pull --rebase --autostash
    echo
    echo "===== STATO CORRENTE (STATO_LAVORI.md) ====="
    sed -n '1,12p' STATO_LAVORI.md
    echo
    echo "===== CLAIM ATTIVI (LAVORI_IN_CORSO.md) ====="
    grep -E '^\|' LAVORI_IN_CORSO.md | grep -v -E '^\|[-: ]+\|' || echo "(nessun claim)"
    echo
    echo "ℹ  Per un consulto in chat: allega STATO_LAVORI.md e LAVORI_IN_CORSO.md"
    ;;

  end)
    msg="${2:-}"
    if [ -z "$msg" ]; then
      echo "✗ Serve un messaggio di commit: ./sync.sh end \"cosa hai fatto\""
      exit 1
    fi

    # Guardia disciplina handoff: STATO_LAVORI.md dev'essere stato toccato
    if git status --porcelain | grep -q 'STATO_LAVORI.md'; then
      echo "✓ STATO_LAVORI.md aggiornato in questa sessione."
    else
      echo "⚠  STATO_LAVORI.md NON risulta modificato: manca l'handoff."
      read -r -p "   Committare comunque senza handoff? [y/N] " ans
      if [ "${ans:-N}" != "y" ] && [ "${ans:-N}" != "Y" ]; then
        echo "   Annullato. Scrivi l'handoff prima di chiudere la sessione."
        exit 1
      fi
    fi

    git add -A
    git commit -m "$msg"
    echo "→ Push verso origin..."
    git push
    echo "✓ Fatto. La sessione è sincronizzata sul remoto."
    ;;

  *)
    echo "Uso:"
    echo "  ./sync.sh start              # a inizio sessione: pull + stato"
    echo "  ./sync.sh end \"messaggio\"    # a fine sessione: commit + push"
    exit 1
    ;;
esac
