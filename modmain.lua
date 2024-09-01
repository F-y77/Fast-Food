local assets = {
	Asset("ATLAS", "images/inventoryimages/pancake.xml"),
    Asset("IMAGE", "images/inventoryimages/pancake.tex"),

	Asset("ATLAS", "images/inventoryimages/fries.xml"),
    Asset("IMAGE", "images/inventoryimages/fries.tex"),

	Asset("ATLAS", "images/inventoryimages/sushi_roll.xml"),
    Asset("IMAGE", "images/inventoryimages/sushi_roll.tex"),

}


PrefabFiles = {
	"pancake",
	"fries",
	"sushi_roll"
}

AddIngredientValues({"pancake"}, {pancake = 1})
AddIngredientValues({"fries"}, {fries = 1})
AddIngredientValues({"sushi_roll"}, {sushi_roll = 1})

local pancake =
    {
	name = "pancake",
	    test = function(cooker, names, tags) return (names.tomato or names.tomato_cooked) and tags.meat and tags.meat >= 0.5 end,
        priority = 8,
	    weight = 1,
        foodtype = GLOBAL.FOODTYPE.MEAT, 
        perishtime = TUNING.PERISH_SLOW,
        cooktime = 0.7,
		potlevel = "low",    
        --floater = {"med", nil, 0.6},
}

local fries =
    {
	name = "fries",
	    test = function(cooker, names, tags) return ((names.potato and names.potato > 1) or (names.potato_cooked and names.potato_cooked > 1) or (names.potato and names.potato_cooked > 1) or (names.potato_cooked and names.potato_cooked)) and not tags.meat and not tags.inedible end,
        priority = 10,
	    weight = 1,
        foodtype = GLOBAL.FOODTYPE.GOODIES, 
        perishtime = TUNING.PERISH_SLOW,
        cooktime = 0.6,
		potlevel = "low",    
        --floater = {"med", nil, 0.5},
}

local sushi_roll =
    {
	name = "sushi_roll",
	    test = function(cooker, names, tags) return ((names.fishmeat_small or 0) + (names.fishmeat_small_cooked or 0) + (names.kelp or 0) + (names.kelp_dried or 0) + (names.kelp_cooked or 0)) == 3 and (tags.fish and tags.fish >= 1) end,
        priority = 30,
	    weight = 1,
        foodtype = GLOBAL.FOODTYPE.MEAT, 
        perishtime = TUNING.PERISH_MED,
        cooktime = 0.4,
		potlevel = "low",    
        --floater = {"med", nil, 0.7},
}



AddCookerRecipe("cookpot", pancake)
AddCookerRecipe("portablecookpot", pancake)
AddCookerRecipe("archive_cookpot", pancake)

AddCookerRecipe("cookpot", fries)
AddCookerRecipe("portablecookpot", fries)
AddCookerRecipe("archive_cookpot", fries)

AddCookerRecipe("cookpot", sushi_roll)
AddCookerRecipe("portablecookpot", sushi_roll)
AddCookerRecipe("archive_cookpot", sushi_roll)