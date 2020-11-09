# Liste offener Punkte [LOP]

### Grundlagen

* App anpassen, um beim Zustandswechsel einen kleineren Teils des Widget-Trees auszutauschen. (Optimierung der Performanz!) [WIP]
  
* Kapitel über die Applikation, unabhängig von Zustandsverwaltungsmethoden (folgend ZVM), verfassen [WIP]

   + Welche Eigenschaften des Frameworks werden genutzt?
   + Wie interagiert die Softwarearchitektur mit den untersuchten Kriterien
   + Datenmodell näher erklären

* Methodik Zusamenfassen

   + Verwendete Tools beschreiben

---

### Methodik

* Kapitel für die jeweiligen ZVM verfassen

* Automatisierte Tests:

   + CPU-Taktfrequenz vereinheitlichen (CPU-Governor überbrücken, am Beispiel von Filip Hracek)
   + Gemeinsamkeiten in einem Kapitel zusammenfassen

---

### Ergebnisse

* Datenauswertung:

 + Gelesene Daten verstehen/ordnen
   - Entsprechendes Kapitel verfassen
 + Daten als Datei exportieren
 + Analyse-Skript erstellen
 + aussagekräftige Graphiken erstellen
   - Entsprechende Software finden
---

### Layout & Diagramme

- Diagrammsoftware wählen
- Diagramme und Schaubilder erstellen
  - Datenfluss der einzelnen ZVM veranschaulichen
  - Messergebnisse ordentlich darstellen
- Finale überprüfung des Layouts, nachdem alle Texte geschrieben sind
  
---

## Abgearbeitete Punkte: (in chronologischer Reihenfolge)

* Die jeweiligen ZVM implementieren (201021-1155)

   + [x] setState
   + [x] Provider
   + [x] BLoC
   + [x] Redux (201020-1717)
   + [x] MobX (201021-1155)

* Einleitung/Exposé überarbeiten (201024-1540)
* Stand der Wissenschaft/Technik beleuchten (201025-1912)
* Integrationstests zur Messung der Renderzeiten für jede ZVM implementiert (201028-1630)
* Zu viele Videospiele die mich ablenken (24/7)