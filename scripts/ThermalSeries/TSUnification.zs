import crafttweaker.api.item.ItemStack;
import crafttweaker.api.item.IItemStack;

//Some handy crafting constants
val press = <recipetype:thermal:press>;
//val pyrolyzer = <recipetype:thermal:pyrolyzer>;
val compressionFuel = <recipetype:thermal:compression_fuel>;
val centrifuge = <recipetype:thermal:centrifuge>;

//Remove all gear recipes
val gearsArray = [<item:thermal:iron_gear>,<item:thermal:gold_gear>,<item:thermal:lapis_gear>,<item:thermal:diamond_gear>,<item:thermal:emerald_gear>,
<item:thermal:quartz_gear>,<item:thermal:copper_gear>,<item:thermal:tin_gear>,<item:thermal:lead_gear>,<item:thermal:silver_gear>,
<item:thermal:nickel_gear>,<item:thermal:bronze_gear>,<item:thermal:electrum_gear>,<item:thermal:invar_gear>,<item:thermal:constantan_gear>,
<item:thermal:signalum_gear>,<item:thermal:lumium_gear>,<item:thermal:enderium_gear>] as IItemStack[];
for i in(gearsArray){
    craftingTable.removeRecipe(i);
}

//Change coke to IE coal coke
press.removeRecipe(<item:thermal:coal_coke>);
press.removeRecipe(<item:thermal:coal_coke_block>);
// <recipetype:thermal:press>.addRecipe(String name, MCWeightedItemStack[] outputs, IFluidStack outputFluid, IIngredient[] ingredients, int energy);
press.addRecipe("coke_unpacking", [<item:immersiveengineering:coal_coke>%900], <fluid:minecraft:empty>, 
[<tag:items:forge:storage_blocks/coal_coke>, <item:thermal:press_unpacking_die>], 400);

press.addRecipe("coke_packing", [<item:immersiveengineering:coke>%100], <fluid:minecraft:empty>, 
[<item:immersiveengineering:coal_coke>*9, <item:thermal:press_packing_3x3_die>], 400);

craftingTable.removeRecipe(<item:thermal:coal_coke>);
craftingTable.removeRecipe(<item:thermal:coal_coke_block>);

    //ADD PYROLYZER STUFF (creosote and coke) WHEN IT GETS SUPPORT!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

compressionFuel.removeFuel(<fluid:thermal:creosote>);
// <recipetype:thermal:compression_fuel>.addFuel(String name, IFluidStack ingredient, int energy);
compressionFuel.addFuel("creosote_compression", <fluid:immersiveengineering:creosote>*1000, 20000);

//Sawblade
craftingTable.removeRecipe(<item:thermal:saw_blade>);
craftingTable.removeRecipe(<item:thermal:machine_sawmill>);
craftingTable.addShaped("sawmill_thermal", <item:thermal:machine_sawmill>,[
    [<item:minecraft:air>, <tag:items:forge:sawblades>, <item:minecraft:air>],
    [<tag:items:forge:stone>, <item:thermal:machine_frame>, <tag:items:forge:stone>],
    [<tag:items:forge:gears/copper>, <item:thermal:rf_coil>, <tag:items:forge:gears/copper>]
]);

//Honey------------------------------------------------------- later, need to find COFH id first

