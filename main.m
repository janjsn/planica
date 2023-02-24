addpath(genpath(pwd()));

Athletes = get_athletes();

[Tip_array] = get_tips();

fieldnames_tip = fieldnames(Tip_array(1));

unique_countries = unique({Athletes.country});

%% Calc number of medals per country in tips
medals_per_unique_country = zeros(1,length(unique_countries));
for i = 1:length(Tip_array)
    for fields = 1:length(fieldnames_tip)
        this_athlete_tip = Tip_array(i).(fieldnames_tip{fields});
        for aths = 1:length(Athletes)
            if strcmp(this_athlete_tip, Athletes(aths).name)
                this_country = Athletes(aths).country;
                for countries = 1:length(unique_countries)
                    if strcmp(this_country, unique_countries{countries})
                        medals_per_unique_country(countries) = medals_per_unique_country(countries) + 1;
                    end
                end

            end
        end

    end
end


[~,idx] = sort(medals_per_unique_country, 'descend');

plot_vals = medals_per_unique_country(idx)/length(Tip_array);
plot_xticks = unique_countries(idx);
binary_positive = plot_vals >0;
plot_vals = plot_vals(binary_positive);
plot_xticks = plot_xticks(binary_positive);

figure
bar(plot_vals);
xticklabels(plot_xticks);
ylim([0 max(plot_vals)+1])
grid on
ylabel('Medals')
xlabel('Country')

%% Add medalists

Results = Tips;
Results.women_sprint_gold = 'Jonna Sundling';
Results.women_sprint_silver = 'Emma Ribom';
Results.women_sprint_bronze = 'Maja Dahlqvist';
Results.women_sprint_dsq = 'Izabela Marcisz';

Results.men_sprint_gold = 'Johannes Høsflot Klæbo';
Results.men_sprint_silver = 'Pål Golberg';
Results.men_sprint_bronze = 'Jules Chappaz';
Results.men_sprint_dsq = 'Joe Tawk';

Results.men_30km_gold = 'Simen Hegstad Krueger';
Results.men_30km_silver = 'Johannes Høsflot Klæbo';
Results.men_30km_bronze = 'Sjur Røthe';


%% Define events
events = {'men_sprint',...
    'women_sprint',...
    'men_30km',...
    'women_15km',...
    'women_team_sprint',...
    'men_team_sprint',...
    'women_10km',...
    'men_15km',...
    'men_50km',...
    'women_30km',...
    'women_relay',...
    'men_relay'...
};

%% Calculate standings
Table = Standings;

for i = 1:length(Tip_array)
    points_this = 0;
    for j = 1:length(events)
        tip_this_gold = Tip_array(i).([events{j} '_gold']);
        tip_this_silver = Tip_array(i).([events{j} '_silver']);
        tip_this_bronze = Tip_array(i).([events{j} '_bronze']);
        results_this_gold = Results.([events{j} '_gold']);
        results_this_silver = Results.([events{j} '_silver']);
        results_this_bronze = Results.([events{j} '_bronze']);
        
        %Check gold tip
        if strcmp(tip_this_gold,results_this_gold)
            points_this = points_this+3;
        elseif strcmp(tip_this_gold,results_this_silver)
            points_this = points_this+1;
        elseif strcmp(tip_this_gold,results_this_bronze)
            points_this = points_this+1;
        end
        %Check silver tip
        if strcmp(tip_this_silver,results_this_silver)
            points_this = points_this+2;
        elseif strcmp(tip_this_silver,results_this_gold)
            points_this = points_this+1;
        elseif strcmp(tip_this_silver,results_this_bronze)
            points_this = points_this+1;
        end
        %Check bronze tip
        if strcmp(tip_this_bronze,results_this_silver)
            points_this = points_this+1;
        elseif strcmp(tip_this_bronze,results_this_gold)
            points_this = points_this+1;
        elseif strcmp(tip_this_bronze,results_this_bronze)
            points_this = points_this+2;
        end
    end
    Tip_array(i).points = points_this;
end

%% Print results
points = [Tip_array.points];
participants = {Tip_array.participant_name};

[~,idx] = sort(points,'descend');

c = 1;
prev =0 ;
for i = 1:length(idx)
    if points(idx(i)) < prev
        c=i;
    end
        fprintf([num2str(c) '. ' participants{idx(i)} ': ' num2str(points(idx(i))) 'p \n'])
        prev = points(idx(i));
    
end



