function [Tip_array] = get_tips()

[~,~,raw] = xlsread('utøverdatabase.xlsx', 'tips');

mSize = size(raw);

first_row = 3;

Tip_array(1:mSize(1)-2) = Tips;

for i = first_row:mSize(1)
    

    Tip_array(i-2).participant_name = raw{i,2};
    Tip_array(i-2).women_sprint_gold = raw{i,3};
    Tip_array(i-2).women_sprint_silver = raw{i,4};
    Tip_array(i-2).women_sprint_bronze = raw{i,5};
    Tip_array(i-2).women_sprint_dsq = raw{i,6};

    Tip_array(i-2).men_sprint_gold = raw{i,7};
    Tip_array(i-2).men_sprint_silver = raw{i,8};
    Tip_array(i-2).men_sprint_bronze = raw{i,9};
    Tip_array(i-2).men_sprint_dsq = raw{i,10};

    Tip_array(i-2).men_30km_gold = raw{i,11};
    Tip_array(i-2).men_30km_silver = raw{i,12};
    Tip_array(i-2).men_30km_bronze = raw{i,13};

    Tip_array(i-2).women_15km_gold = raw{i,14};
    Tip_array(i-2).women_15km_silver = raw{i,15};
    Tip_array(i-2).women_15km_bronze = raw{i,16};

    Tip_array(i-2).women_team_sprint_gold = raw{i,17};
    Tip_array(i-2).women_team_sprint_silver= raw{i,18};
    Tip_array(i-2).women_team_sprint_bronze = raw{i,19};

    Tip_array(i-2).men_team_sprint_gold = raw{i,20};
    Tip_array(i-2).men_team_sprint_silver = raw{i,21};
    Tip_array(i-2).men_team_sprint_bronze = raw{i,22};

    Tip_array(i-2).women_10km_gold = raw{i,23};
    Tip_array(i-2).women_10km_silver = raw{i,24};
    Tip_array(i-2).women_10km_bronze = raw{i,25};

    Tip_array(i-2).men_15km_gold = raw{i,26};
    Tip_array(i-2).men_15km_silver = raw{i,27};
    Tip_array(i-2).men_15km_bronze = raw{i,28};

    Tip_array(i-2).men_50km_gold = raw{i,29};
    Tip_array(i-2).men_50km_silver = raw{i,30};
    Tip_array(i-2).men_50km_bronze = raw{i,31};

    Tip_array(i-2).women_30km_gold = raw{i,32};
    Tip_array(i-2).women_30km_silver = raw{i,33};
    Tip_array(i-2).women_30km_bronze = raw{i,34};

    Tip_array(i-2).women_relay_gold = raw{i,35};
    Tip_array(i-2).women_relay_silver = raw{i,36};
    Tip_array(i-2).women_relay_bronze = raw{i,37};

    Tip_array(i-2).men_relay_gold = raw{i,38};
    Tip_array(i-2).men_relay_silver = raw{i,39};
    Tip_array(i-2).men_relay_bronze = raw{i,40};

end


end

