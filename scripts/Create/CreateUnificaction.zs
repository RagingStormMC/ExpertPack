//variables and constants
val washing = <recipetype:create:splashing>;
val pressing = <recipetype:create:pressing>;

//Copper --> thermal
craftingTable.removeRecipe(<item:create:copper_block>);
craftingTable.removeRecipe(<item:create:copper_ingot>);
furnace.removeRecipe(<item:create:copper_ingot>);
blastFurnace.removeRecipe(<item:create:copper_ingot>);

furnace.addRecipe("copper_from_crushed_ore", <item:thermal:copper_ingot>, <item:create:crushed_copper_ore>, 0.6, 200);
blastFurnace.addRecipe("copper_from_crushed_ore_blast", <item:thermal:copper_ingot>, <item:create:crushed_copper_ore>, 0.6, 100);

washing.removeRecipe(<item:create:copper_nugget>);
// <recipetype:create:splashing>.addRecipe(String name, MCWeightedItemStack[] output, IIngredient input, @Optional(100) int duration)
washing.addRecipe("copper_ingots_washing", [<item:thermal:copper_nugget>*10, <item:thermal:copper_nugget>*5%50], <item:create:crushed_copper_ore>);

craftingTable.removeRecipe(<item:create:copper_nugget>);

pressing.removeRecipe(<item:create:copper_sheet>);
// <recipetype:create:pressing>.addRecipe(String name, MCWeightedItemStack[] output, IIngredient input, @Optional(100) int duration)
pressing.addRecipe("copper_plate_pressing", [<item:thermal:copper_plate>], <tag:items:forge:ingots/copper>);