local assets = {
	Asset("ATLAS", "images/inventoryimages/pancake.xml"),
    Asset("IMAGE", "images/inventoryimages/pancake.tex"),

}


PrefabFiles = {
	"pancake",
}

AddIngredientValues({"pancake"}, {pancake = 1})



    --[[local food =
    {
	name = "pancake",
    {
		test = function(cooker, names, tags) return (names.tomato or names.tomato_cooked) and tags.meat and tags.meat >= 0.5 end,
		priority = 30,
		weight = 1,
		health = 10,
		hunger = 45,
		perishtime = TUNING.PERISH_SLOW,
		sanity = 15,
		cooktime = 0.5,
        floater = {"small", 0.05, 0.7},
		--potlevel = "high",    
        --floater = {"med", nil, 0.55},
		card_def = {ingredients = {{"smallmeat", 1}, {"tomato", 3}} },
	},

    }]]
	
	--recipe
    local pancake =
    {
	name = "pancake",
	    test = function(cooker, names, tags) return (names.tomato or names.tomato_cooked) and tags.meat and tags.meat >= 0.5 end,
        priority = 1,
	    weight = 1,
        foodtype = GLOBAL.FOODTYPE.MEAT, 
        perishtime = TUNING.PERISH_SLOW,
        cooktime = 0.5,
    }

AddCookerRecipe("cookpot", pancake)
AddCookerRecipe("portablecookpot", pancake)
AddCookerRecipe("archive_cookpot", pancake)