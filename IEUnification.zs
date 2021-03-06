import crafttweaker.api.item.IItemStack;
import mods.jei.JEI as JEI;

//Just some handy recipe variables
val metalPress = <recipetype:immersiveengineering:metal_press>;
val thermalPress = <recipetype:thermal:press>;
val alloyKiln = <recipetype:immersiveengineering:alloy>;
val arcFurnace = <recipetype:immersiveengineering:arc_furnace>;
val sawMill = <recipetype:immersiveengineering:sawmill>;
val crusher = <recipetype:immersiveengineering:crusher>;

val slag = <item:thermal:slag>;

//Remove plate recipes and remove press recipes for thermal plates, add servo press recipes
val platesNotThermal = [<item:immersiveengineering:plate_aluminum>,
<item:immersiveengineering:plate_uranium>,
<item:immersiveengineering:plate_steel>] as IItemStack[];
val platesThermal = [<item:immersiveengineering:plate_constantan>,
<item:immersiveengineering:plate_copper>,<item:immersiveengineering:plate_nickel>,
<item:immersiveengineering:plate_lead>,<item:immersiveengineering:plate_silver>,
<item:immersiveengineering:plate_electrum>,<item:immersiveengineering:plate_iron>,
<item:immersiveengineering:plate_gold>] as IItemStack[];

for i in platesNotThermal{
    craftingTable.removeRecipe(i);
}

thermalPress.addRecipe("aluminum_plate_servo_press",[<item:immersiveengineering:plate_aluminum>%100],<fluid:minecraft:empty>,[<tag:items:forge:ingots/aluminum>],2400);
thermalPress.addRecipe("steel_plate_servo_press",[<item:immersiveengineering:plate_steel>%100],<fluid:minecraft:empty>,[<tag:items:forge:ingots/steel>],2400);

for i in platesThermal{
    craftingTable.removeRecipe(i);
    metalPress.removeRecipe(i);
    JEI.hideItem(i);
}

//Remove ingot recipes from ore
val ingotsThermalOre = [<item:immersiveengineering:ingot_nickel>,<item:immersiveengineering:ingot_silver>,<item:immersiveengineering:ingot_lead>,<item:immersiveengineering:ingot_copper>] as IItemStack[];
for i in ingotsThermalOre{
    furnace.removeRecipe(i);
    blastFurnace.removeRecipe(i);
    craftingTable.removeRecipe(i);
}

//Replace alloy recipes
    //constantan
val constantanIE = <item:immersiveengineering:ingot_constantan> as IItemStack;
val electrumIE = <item:immersiveengineering:ingot_electrum> as IItemStack;
for i in ([constantanIE,electrumIE] as IItemStack[]){
    craftingTable.removeRecipe(i);
    furnace.removeRecipe(i);
    blastFurnace.removeRecipe(i);
    alloyKiln.removeRecipe(i);
    arcFurnace.removeRecipe(i);
}
    #alloyKiln.addRecipe(string recipePath, IIngredient inputA, IIngredient inputB, int time, IItemStack output)
alloyKiln.addRecipe("electrum_kiln",<item:minecraft:gold_ingot>,<tag:items:forge:ingots/silver>,140, <item:thermal:electrum_ingot>*2);
alloyKiln.addRecipe("constantan_kiln",<tag:items:forge:ingots/nickel>,<tag:items:forge:ingots/copper>,140, <item:thermal:constantan_ingot>*2);

arcFurnace.addRecipe("electrum_arc_alloy",<item:minecraft:gold_ingot>,[<tag:items:forge:ingots/silver>],100, 51200, [<item:thermal:electrum_ingot>*2]);
arcFurnace.addRecipe("constantan_arc_alloy",<tag:items:forge:ingots/nickel>,[<tag:items:forge:ingots/copper>],100, 51200, [<item:thermal:constantan_ingot>*2]);
arcFurnace.addRecipe("electrum_arc_dust",<tag:items:forge:dusts/electrum>,[],100,51200,[<item:thermal:electrum_ingot>]);
arcFurnace.addRecipe("constantan_arc_dust",<tag:items:forge:dusts/constantan>,[],100,51200,[<item:thermal:constantan_ingot>]);

craftingTable.removeRecipe(<item:immersiveengineering:storage_electrum>);
craftingTable.removeRecipe(<item:immersiveengineering:slab_storage_electrum>);

craftingTable.addShapedMirrored("electrum_block_from_slabs", <item:thermal:electrum_block>, [
    [<item:immersiveengineering:slab_storage_electrum>, <item:minecraft:air>],
    [<item:immersiveengineering:slab_storage_electrum>, <item:minecraft:air>]
]);
craftingTable.addShapedMirrored("electrum_slabs", <item:immersiveengineering:slab_storage_electrum>, [
    [<tag:items:forge:storage_blocks/electrum>, <tag:items:forge:storage_blocks/electrum>, <tag:items:forge:storage_blocks/electrum>]
]);

craftingTable.removeRecipe(<item:immersiveengineering:storage_constantan>);
craftingTable.removeRecipe(<item:immersiveengineering:slab_storage_constantan>);

craftingTable.addShapedMirrored("constantan_block_from_slabs", <item:thermal:constantan_block>, [
    [<item:immersiveengineering:slab_storage_constantan>, <item:minecraft:air>],
    [<item:immersiveengineering:slab_storage_constantan>, <item:minecraft:air>]
]);
craftingTable.addShapedMirrored("constantan_slabs", <item:immersiveengineering:slab_storage_constantan>, [
    [<tag:items:forge:storage_blocks/constantan>, <tag:items:forge:storage_blocks/constantan>, <tag:items:forge:storage_blocks/constantan>]
]);
//Copper ingot stuff

    #arcFurnace.addRecipe(string recipePath, IIngredient mainIngredient, IIngredient[] additives, int time, int energy, IItemStack[] outputs, @Optional(<item:minecraft:air>) IItemStack slag)
val copperIE = <item:immersiveengineering:ingot_copper>;
arcFurnace.removeRecipe(copperIE);
arcFurnace.addRecipe("copper_arc_dust",<tag:items:forge:dusts/copper>,[],100,51200,[<item:thermal:copper_ingot>]);
arcFurnace.addRecipe("copper_arc_ore",<tag:items:forge:ores/copper>,[],200,102400,[<item:thermal:copper_ingot>*2],slag);

craftingTable.removeRecipe(<item:immersiveengineering:storage_copper>);
craftingTable.removeRecipe(<item:immersiveengineering:slab_storage_copper>);

craftingTable.addShapedMirrored("copper_block_from_slabs", <item:thermal:copper_block>, [
    [<item:immersiveengineering:slab_storage_copper>, <item:minecraft:air>],
    [<item:immersiveengineering:slab_storage_copper>, <item:minecraft:air>]
]);
craftingTable.addShapedMirrored("copper_slabs", <item:immersiveengineering:slab_storage_copper>, [
    [<tag:items:forge:storage_blocks/copper>, <tag:items:forge:storage_blocks/copper>, <tag:items:forge:storage_blocks/copper>]
]);
//Nickel ingot stuff
val nickelIE = <item:immersiveengineering:ingot_nickel>;
arcFurnace.removeRecipe(nickelIE);
arcFurnace.addRecipe("nickel_arc_dust",<tag:items:forge:dusts/nickel>,[],100,51200,[<item:thermal:nickel_ingot>]);
arcFurnace.addRecipe("nickel_arc_ore",<tag:items:forge:ores/nickel>,[],200,102400,[<item:thermal:nickel_ingot>*2],slag);

craftingTable.removeRecipe(<item:immersiveengineering:storage_nickel>);
craftingTable.removeRecipe(<item:immersiveengineering:slab_storage_nickel>);

craftingTable.addShapedMirrored("nickel_block_from_slabs", <item:thermal:nickel_block>, [
    [<item:immersiveengineering:slab_storage_nickel>, <item:minecraft:air>],
    [<item:immersiveengineering:slab_storage_nickel>, <item:minecraft:air>]
]);
craftingTable.addShapedMirrored("nickel_slabs", <item:immersiveengineering:slab_storage_nickel>, [
    [<tag:items:forge:storage_blocks/nickel>, <tag:items:forge:storage_blocks/nickel>, <tag:items:forge:storage_blocks/nickel>]
]);

//Silver ingot stuff
val silverIE = <item:immersiveengineering:ingot_silver>;
arcFurnace.removeRecipe(silverIE);
arcFurnace.addRecipe("silver_arc_dust",<tag:items:forge:dusts/silver>,[],100,51200,[<item:thermal:silver_ingot>]);
arcFurnace.addRecipe("silver_arc_ore",<tag:items:forge:ores/silver>,[],200,102400,[<item:thermal:silver_ingot>*2],slag);

craftingTable.removeRecipe(<item:immersiveengineering:storage_silver>);
craftingTable.removeRecipe(<item:immersiveengineering:slab_storage_silver>);

craftingTable.addShapedMirrored("silver_block_from_slabs", <item:thermal:silver_block>, [
    [<item:immersiveengineering:slab_storage_silver>, <item:minecraft:air>],
    [<item:immersiveengineering:slab_storage_silver>, <item:minecraft:air>]
]);
craftingTable.addShapedMirrored("silver_slabs", <item:immersiveengineering:slab_storage_silver>, [
    [<tag:items:forge:storage_blocks/silver>, <tag:items:forge:storage_blocks/silver>, <tag:items:forge:storage_blocks/silver>]
]);

//Lead ingot stuff
val leadIE = <item:immersiveengineering:ingot_lead>;
arcFurnace.removeRecipe(leadIE);
arcFurnace.addRecipe("lead_arc_dust",<tag:items:forge:dusts/lead>,[],100,51200,[<item:thermal:lead_ingot>]);
arcFurnace.addRecipe("lead_arc_ore",<tag:items:forge:ores/lead>,[],200,102400,[<item:thermal:lead_ingot>*2],slag);

craftingTable.removeRecipe(<item:immersiveengineering:storage_lead>);
craftingTable.removeRecipe(<item:immersiveengineering:slab_storage_lead>);

craftingTable.addShapedMirrored("lead_block_from_slabs", <item:thermal:lead_block>, [
    [<item:immersiveengineering:slab_storage_lead>, <item:minecraft:air>],
    [<item:immersiveengineering:slab_storage_lead>, <item:minecraft:air>]
]);
craftingTable.addShapedMirrored("lead_slabs", <item:immersiveengineering:slab_storage_lead>, [
    [<tag:items:forge:storage_blocks/lead>, <tag:items:forge:storage_blocks/lead>, <tag:items:forge:storage_blocks/lead>]
]);

//Slag
arcFurnace.removeRecipe(<item:minecraft:netherite_scrap>*2, true);
arcFurnace.removeRecipe(<item:immersiveengineering:ingot_uranium>*2, true);
arcFurnace.removeRecipe(<item:minecraft:gold_ingot>*2, true);
arcFurnace.removeRecipe(<item:thermal:tin_ingot>*2, true);
arcFurnace.removeRecipe(<item:immersiveengineering:ingot_steel>, true);
arcFurnace.removeRecipe(<item:minecraft:iron_ingot>*2, true);
arcFurnace.removeRecipe(<item:immersiveengineering:ingot_aluminum>*2, true);

arcFurnace.addRecipe("netherite_arc_ore",<tag:items:forge:ores/netherite_scrap>,[],100,512000,[<item:minecraft:netherite_scrap>*2],slag);
arcFurnace.addRecipe("uranium_arc_ore",<tag:items:forge:ores/uranium>,[],200,102400,[<item:immersiveengineering:ingot_uranium>*2],slag);
arcFurnace.addRecipe("gold_arc_ore",<tag:items:forge:ores/gold>,[],200,102400,[<item:minecraft:gold_ingot>*2],slag);
arcFurnace.addRecipe("tin_arc_ore",<tag:items:forge:ores/tin>,[],200,102400,[<item:thermal:tin_ingot>*2],slag);
arcFurnace.addRecipe("steel_arc",<tag:items:forge:ingots/iron>,[<tag:items:forge:dusts/coal_coke>],400,51200,[<item:immersiveengineering:ingot_steel>],slag);
arcFurnace.addRecipe("iron_arc_ore",<tag:items:forge:ores/iron>,[],200,102400,[<item:minecraft:iron_ingot>*2],slag);
arcFurnace.addRecipe("aluminum_arc_ore",<tag:items:forge:ores/aluminum>,[],200,102400,[<item:immersiveengineering:ingot_aluminum>*2],slag);

val clay = <item:minecraft:clay_ball>;
craftingTable.removeRecipe(<item:immersiveengineering:concrete>);
craftingTable.addShaped("immersiveengineering_concrete", <item:immersiveengineering:concrete>*12, [
    [slag, clay, slag],
    [<item:minecraft:gravel>, <item:minecraft:water_bucket>, <item:minecraft:gravel>],
    [slag, clay, slag]
]);

//Sawdust
sawMill.removeRecipe(<item:immersiveengineering:dust_wood>);
    //Not adding recipes as I'll probably change them later on anyway

//Sulfur
crusher.removeRecipe(<item:immersiveengineering:dust_sulfur>);

// crusher.addRecipe(string recipePath, IIngredient input, int energy, IItemStack mainOutput, MCWeightedItemStack... additionalOutputs)
crusher.addRecipe("coal_crusher", <item:minecraft:coal_ore>, 6000, <item:minecraft:coal>*4, <item:thermal:sulfur_dust>%15);
crusher.addRecipe("quartz_crusher", <item:minecraft:nether_quartz_ore>, 5000, <item:minecraft:quartz>*3, <item:thermal:sulfur_dust>%25);
crusher.addRecipe("blaze_crusher", <item:minecraft:blaze_rod>, 5000, <item:minecraft:blaze_powder>*4, <item:thermal:sulfur_dust>%50);
crusher.addRecipe("lapis_crusher", <item:minecraft:lapis_ore>, 3500, <item:minecraft:lapis_lazuli>*9, <item:thermal:sulfur_dust>%20);