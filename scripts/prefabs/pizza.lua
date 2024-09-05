require "prefabutil"

local assets =
{
  Asset("ANIM", "anim/pizza.zip"),
  Asset("ATLAS", "images/inventoryimages/pizza.xml"),
}

local function fn(Sim)
    local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("pizza")
    inst.AnimState:SetBuild("pizza")
    inst.AnimState:PlayAnimation("idle")

    inst:AddTag("preparedfood")

    if not TheWorld.ismastersim then
        return inst
    end

    inst.entity:SetPristine()

    inst:AddComponent("edible")
    inst.components.edible.foodtype = "MEAT"
    inst.components.edible.foodstate = "PREPARED"

    inst.components.edible.healthvalue = 13
    inst.components.edible.hungervalue = 150
    inst.components.edible.sanityvalue = 27

    inst:AddComponent("stackable")
    inst.components.stackable.maxsize = 7

    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/pizza.xml"

    MakeHauntableLaunch(inst)

    inst:AddComponent("perishable")
    inst.components.perishable:SetPerishTime(TUNING.PERISH_MED)
    inst.components.perishable:StartPerishing()
    inst.components.perishable.onperishreplacement = "spoiled_food"

return inst
end
STRINGS.NAMES.PIZZA = "番茄蛋披萨"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.PIZZA = "番茄和鸟蛋作为料理。"


return Prefab("common/inventory/pizza", fn, assets, prefabs )