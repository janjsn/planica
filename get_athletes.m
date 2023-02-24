function AthleteArray = get_athletes()

filename = 'utøverdatabase.xlsx';

athlete_database = readtable(filename, 'sheet', 'database');

[n_athletes,~] = size(athlete_database);

AthleteArray(1:n_athletes) = Athlete;

for i = 1:n_athletes
AthleteArray(i).name = athlete_database.Name{i};
AthleteArray(i).country = athlete_database.Country{i};
AthleteArray(i).municipality = athlete_database.Municipality{i};
end





end

