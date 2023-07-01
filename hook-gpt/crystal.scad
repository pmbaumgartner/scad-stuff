$fn = 100;

// Defining the base
cylinder(h = 10, r = 10);

// Defining the crystal
translate([ 0, 0, 10 ]) polyhedron(
    // Vertices
    points =
        [
            [ 0, 0, 0 ],                                            // Bottom
            [ -7, -4, 12 ],                                         // The rest are the top points
            [ 6, -5, 8 ], [ 4, 5, 15 ], [ -4, 7, 10 ], [ 0, 0, 20 ] // Top point
        ],
    // Faces
    faces = [ [ 0, 1, 2 ], [ 0, 2, 3 ], [ 0, 3, 4 ], [ 0, 4, 1 ], [ 1, 2, 5 ], [ 2, 3, 5 ], [ 3, 4, 5 ], [ 4, 1, 5 ] ]);