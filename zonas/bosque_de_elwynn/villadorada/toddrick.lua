local TopperMcNabb = {
	entry = 3935,
	frases = {
		[0] = 'La última vaca que maté tenía una mirada rara... es como si no quisiera irse...'
	},
	emotes = {
		picarCarne = 173
	}
};

function TopperMcNabb.OnSpawn(event, creature)
	creature:RegisterEvent(TopperMcNabb.Talk, 100000, 0)
end

function TopperMcNabb.Talk(eventid, delay, repeats, creature)
	creature:SendUnitSay(TopperMcNabb.frases[0], 0)
end

RegisterCreatureEvent(TopperMcNabb.entry, 5, TopperMcNabb.OnSpawn)