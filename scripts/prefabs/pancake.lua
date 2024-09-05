require "prefabutil"

local assets =
{
  Asset("ANIM", "anim/pancake.zip"),
  Asset("ATLAS", "images/inventoryimages/pancake.xml"),
}

local function fn(Sim)
    local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("pancake")
    inst.AnimState:SetBuild("pancake")
    inst.AnimState:PlayAnimation("idle")

    inst:AddTag("preparedfood")

    if not TheWorld.ismastersim then
        return inst
    end

    inst.entity:SetPristine()

    inst:AddComponent("edible")
    inst.components.edible.foodtype = "MEAT"
    inst.components.edible.foodstate = "PREPARED"

    inst.components.edible.healthvalue = 5
    inst.components.edible.hungervalue = 65
    inst.components.edible.sanityvalue = 25

    inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_MEDITEM

    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/pancake.xml"

    MakeHauntableLaunch(inst)

    inst:AddComponent("perishable")
    inst.components.perishable:SetPerishTime(TUNING.PERISH_SLOW)
    inst.components.perishable:StartPerishing()
    inst.components.perishable.onperishreplacement = "spoiled_food"

return inst
end
STRINGS.NAMES.PANCAKE = "番茄肉夹馍"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.PANCAKE = "番茄与大肉的美好组合。"


return Prefab("common/inventory/pancake", fn, assets, prefabs )