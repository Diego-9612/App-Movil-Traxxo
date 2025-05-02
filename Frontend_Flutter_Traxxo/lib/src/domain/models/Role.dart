class Role {
    String id;
    String name;
    String image;
    String route;

    Role({
        required this.id,
        required this.name,
        required this.image,
        required this.route,
    });

    factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        route: json["route"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "route": route,
    };
}
