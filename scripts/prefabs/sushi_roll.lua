require "prefabutil"

local assets =
{
  Asset("ANIM", "anim/sushi_roll.zip"),
  Asset("ATLAS", "images/inventoryimages/sushi_roll.xml"),
}

local function fn(Sim)
    local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("sushi_roll")
    inst.AnimState:SetBuild("sushi_roll")
    inst.AnimState:PlayAnimation("idle")

    inst:AddTag("preparedfood")

    if not TheWorld.ismastersim then
        return inst
    end

    inst.entity:SetPristine()

    inst:AddComponent("edible")
    inst.components.edible.foodtype = "MEAT"
    inst.components.edible.foodstate = "PREPARED"

    inst.components.edible.healthvalue = 30
    inst.components.edible.hungervalue = 55
    inst.components.edible.sanityvalue = 25

    inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/sushi_roll.xml"

    MakeHauntableLaunch(inst)

    inst:AddComponent("perishable")
    inst.components.perishable:SetPerishTime(TUNING.PERISH_MED)
    inst.components.perishable:StartPerishing()
    inst.components.perishable.onperishreplacement = "spoiled_food"

return inst
end
STRINGS.NAMES.SUSHI_ROLL = "寿司串"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.SUSHI_ROLL = "清淡的鱼类米食。"


return Prefab("common/inventory/sushi_roll", fn, assets, prefabs )