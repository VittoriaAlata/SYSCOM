# Chiedi all'utente di inserire la descrizione per il punto di ripristino
$description = Read-Host -Prompt "Inserisci la descrizione per il punto di ripristino"

# Crea il punto di ripristino utilizzando la descrizione fornita
Checkpoint-Computer -Description $description -RestorePointType MODIFY_SETTINGS