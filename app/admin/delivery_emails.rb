ActiveAdmin.register DeliveryEmail do
  # Pozwala na wyświetlenie pól w tabeli widoku indeksu
  index do
    selectable_column
    id_column
    column :recipient_email

    # Dodaj inne pola, które chcesz wyświetlić w widoku indeksu
    actions # Dodaje standardowe akcje (edytuj, usuń) dla każdego rekordu
  end

  # Pozwala na konfigurację pól do edycji i tworzenia nowych rekordów
  form do |f|
    f.inputs do
      f.input :recipient_email

      # Dodaj inne pola, które chcesz umożliwić edytowanie i tworzenie
    end
    f.actions # Dodaje standardowe przyciski "Zapisz" i "Anuluj"
  end
  permit_params :recipient_email
  # Dodaj inne akcje i konfiguracje, jeśli są potrzebne
end