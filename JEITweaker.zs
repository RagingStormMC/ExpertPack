import crafttweaker.api.item.IItemStack;
import crafttweaker.api.fluid.IFluidStack;
import mods.jei.JEI as JEI;

val disbledItems= [
<item:immersiveengineering:nugget_constantan>,
<item:immersiveengineering:nugget_copper>,
<item:immersiveengineering:nugget_nickel>,
<item:immersiveengineering:nugget_lead>,
<item:immersiveengineering:nugget_silver>,
<item:immersiveengineering:nugget_electrum>,
<item:immersiveengineering:ingot_constantan>,
<item:immersiveengineering:ingot_copper>,
<item:immersiveengineering:ingot_nickel>,
<item:immersiveengineering:ingot_lead>,
<item:immersiveengineering:ingot_silver>,
<item:immersiveengineering:ingot_electrum>,
<item:immersiveengineering:storage_constantan>,
<item:immersiveengineering:storage_copper>,
<item:immersiveengineering:storage_nickel>,
<item:immersiveengineering:storage_lead>,
<item:immersiveengineering:storage_silver>,
<item:immersiveengineering:storage_electrum>,
<item:immersiveengineering:dust_constantan>,
<item:immersiveengineering:dust_copper>,
<item:immersiveengineering:dust_nickel>,
<item:immersiveengineering:dust_lead>,
<item:immersiveengineering:dust_silver>,
<item:immersiveengineering:dust_electrum>,
<item:immersiveengineering:dust_iron>,
<item:immersiveengineering:dust_gold>,
<item:immersiveengineering:ore_copper>,
<item:immersiveengineering:ore_lead>,
<item:immersiveengineering:ore_nickel>,
<item:immersiveengineering:ore_silver>,
<item:immersiveengineering:dust_wood>,
<item:immersiveengineering:dust_sulfur>,

<item:thermal:coal_coke_block>,
<item:thermal:creosote_bucket>,
<item:thermal:saw_blade>
] as IItemStack[];

for i in disbledItems{
    JEI.hideItem(i);
}

val disabledFluids = [
    <fluid:thermal:creosote>
] as IFluidStack[];

for i in disabledFluids{
    JEI.hideFluid(i);
}