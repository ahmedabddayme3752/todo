class Task {

 final String titre;
 final String type;
 final String etat;
 final DateTime startDate;
 final DateTime endDate;
 final int avancement;

 Task({
   
    required this.titre,
    required this.type,
    required this.etat,
    required this.startDate,
    required this.endDate,
    required this.avancement,
 });

 Map<String, dynamic> toMap() {
    return {
     
      'titre': titre,
      'category': type,
      'etat': etat,
      'dateDebut': startDate.toIso8601String(),
      'dateFin': endDate.toIso8601String(),
      'avancement': avancement,
    };
 }

 factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
     
      titre: map['titre'] ?? '',
      type: map['category'] ?? '',
      etat: map['etat'] ?? '',
      startDate: DateTime.parse(map['dateDebut']),
      endDate: DateTime.parse(map['dateFin']),
      avancement: map['avancement'] ?? '',
    );
 }
}