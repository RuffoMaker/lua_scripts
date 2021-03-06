local AIO = AIO or require("AIO")
if AIO.AddAddon() then
    return
end

local MyHandlers = AIO.AddHandlers("Kaev", {})

-- Attribute window
local frameAttributes = CreateFrame("Frame", "frameAttributes", UIParent)
frameAttributes:SetSize(200, 300)
frameAttributes:SetMovable(true)
frameAttributes:EnableMouse(true)
frameAttributes:RegisterForDrag("LeftButton")
frameAttributes:SetPoint("RIGHT", -100, 0)
frameAttributes:SetBackdrop(
{
    bgFile = "Interface/AchievementFrame/UI-Achievement-Parchment-Horizontal",
    edgeFile = "Interface/DialogFrame/UI-DialogBox-Border",
    edgeSize = 20,
    insets = { left = 5, right = 5, top = 5, bottom = 5 }
})
-- Drag & Drop
frameAttributes:SetScript("OnDragStart", frameAttributes.StartMoving)
frameAttributes:SetScript("OnHide", frameAttributes.StopMovingOrSizing)
frameAttributes:SetScript("OnDragStop", frameAttributes.StopMovingOrSizing)
frameAttributes:Hide()

-- Close button
local buttonAttributesClose = CreateFrame("Button", "buttonAttributesClose", frameAttributes, "UIPanelCloseButton")
buttonAttributesClose:SetPoint("TOPRIGHT", 7, 7)
buttonAttributesClose:EnableMouse(true)
buttonAttributesClose:SetSize(27, 27)

-- Title bar
local frameAttributesTitleBar = CreateFrame("Frame", "frameAttributesTitleBar", frameAttributes, nil)
frameAttributesTitleBar:SetSize(135, 25)
frameAttributesTitleBar:SetBackdrop(
{
    bgFile = "Interface/CHARACTERFRAME/UI-Party-Background",
    edgeFile = "Interface/DialogFrame/UI-DialogBox-Border",
    tile = true,
    edgeSize = 16,
    tileSize = 16,
    insets = { left = 5, right = 5, top = 5, bottom = 5 }
})
frameAttributesTitleBar:SetPoint("TOP", 0, 9)

local fontAttributesTitleText = frameAttributesTitleBar:CreateFontString("fontAttributesTitleText")
fontAttributesTitleText:SetFont("Fonts\\FRIZQT__.TTF", 13)
fontAttributesTitleText:SetSize(190, 5)
fontAttributesTitleText:SetPoint("CENTER", 0, 0)
fontAttributesTitleText:SetText("|cffFFC125Puntos de Alma|r")

-- Attribute points left
local fontAttributesPointsLeft = frameAttributes:CreateFontString("fontAttributesPointsLeft")
fontAttributesPointsLeft:SetFont("Fonts\\FRIZQT__.TTF", 15)
fontAttributesPointsLeft:SetSize(180, 5)
fontAttributesPointsLeft:SetPoint("TOPLEFT", 0, -35)
fontAttributesPointsLeft:SetText("|cFF000000Puntos disponibles: |r")

-- Strength
local fontAttributesStrength = frameAttributes:CreateFontString("fontAttributesStrength")
fontAttributesStrength:SetFont("Fonts\\FRIZQT__.TTF", 15)
fontAttributesStrength:SetSize(137, 5)
fontAttributesStrength:SetPoint("TOPLEFT", -20, -65)
fontAttributesStrength:SetText("|cFF000000Fuerza|r")

local fontAttributesStrengthValue = frameAttributes:CreateFontString("fontAttributesStrengthValue")
fontAttributesStrengthValue:SetFont("Fonts\\FRIZQT__.TTF", 15)
fontAttributesStrengthValue:SetSize(50, 5)
fontAttributesStrengthValue:SetPoint("TOPLEFT", 90, -65)

local buttonAttributesIncreaseStrength = CreateFrame("Button", "buttonAttributesIncreaseStrength", frameAttributes, nil)
buttonAttributesIncreaseStrength:SetSize(20, 20)
buttonAttributesIncreaseStrength:SetPoint("TOPLEFT", 144, -59)
buttonAttributesIncreaseStrength:EnableMouse(true)
buttonAttributesIncreaseStrength:SetNormalTexture("Interface/BUTTONS/UI-SpellbookIcon-NextPage-Up")
buttonAttributesIncreaseStrength:SetHighlightTexture("Interface/BUTTONS/UI-Panel-MinimizeButton-Highlight")
buttonAttributesIncreaseStrength:SetPushedTexture("Interface/BUTTONS/UI-SpellbookIcon-NextPage-Down")
buttonAttributesIncreaseStrength:SetScript("OnMouseUp", function() AIO.Handle("Kaev", "AttributesIncrease", 1) end)
       
--local buttonAttributesDecreaseStrength = CreateFrame("Button", "buttonAttributesDecreaseStrength", frameAttributes, nil)
--buttonAttributesDecreaseStrength:SetSize(20, 20)
--buttonAttributesDecreaseStrength:SetPoint("TOPLEFT", 104, -29)
--buttonAttributesDecreaseStrength:EnableMouse(true)
--buttonAttributesDecreaseStrength:SetNormalTexture("Interface/BUTTONS/UI-SpellbookIcon-PrevPage-Up")
--buttonAttributesDecreaseStrength:SetHighlightTexture("Interface/BUTTONS/UI-Panel-MinimizeButton-Highlight")
--buttonAttributesDecreaseStrength:SetPushedTexture("Interface/BUTTONS/UI-SpellbookIcon-PrevPage-Down")
--buttonAttributesDecreaseStrength:SetScript("OnMouseUp", function() AIO.Handle("Kaev", "AttributesDecrease", 1) end)

-- Agility
local fontAttributesAgility = frameAttributes:CreateFontString("fontAttributesAgility")
fontAttributesAgility:SetFont("Fonts\\FRIZQT__.TTF", 15)
fontAttributesAgility:SetSize(137, 5)
fontAttributesAgility:SetPoint("TOPLEFT", -20, -85)
fontAttributesAgility:SetText("|cFF000000Agilidad|r")

local fontAttributesAgilityValue = frameAttributes:CreateFontString("fontAttributesAgilityValue")
fontAttributesAgilityValue:SetFont("Fonts\\FRIZQT__.TTF", 15)
fontAttributesAgilityValue:SetSize(50, 5)
fontAttributesAgilityValue:SetPoint("TOPLEFT", 90, -85)

local buttonAttributesIncreaseAgility = CreateFrame("Button", "buttonAttributesIncreaseAgility", frameAttributes, nil)
buttonAttributesIncreaseAgility:SetSize(20, 20)
buttonAttributesIncreaseAgility:SetPoint("TOPLEFT", 144, -79)
buttonAttributesIncreaseAgility:EnableMouse(true)
buttonAttributesIncreaseAgility:SetNormalTexture("Interface/BUTTONS/UI-SpellbookIcon-NextPage-Up")
buttonAttributesIncreaseAgility:SetHighlightTexture("Interface/BUTTONS/UI-Panel-MinimizeButton-Highlight")
buttonAttributesIncreaseAgility:SetPushedTexture("Interface/BUTTONS/UI-SpellbookIcon-NextPage-Down")
buttonAttributesIncreaseAgility:SetScript("OnMouseUp", function() AIO.Handle("Kaev", "AttributesIncrease", 2) end)
       
--local buttonAttributesDecreaseAgility = CreateFrame("Button", "buttonAttributesDecreaseAgility", frameAttributes, nil)
--buttonAttributesDecreaseAgility:SetSize(20, 20)
--buttonAttributesDecreaseAgility:SetPoint("TOPLEFT", 104, -49)
--buttonAttributesDecreaseAgility:EnableMouse(true)
--buttonAttributesDecreaseAgility:SetNormalTexture("Interface/BUTTONS/UI-SpellbookIcon-PrevPage-Up")
--buttonAttributesDecreaseAgility:SetHighlightTexture("Interface/BUTTONS/UI-Panel-MinimizeButton-Highlight")
--buttonAttributesDecreaseAgility:SetPushedTexture("Interface/BUTTONS/UI-SpellbookIcon-PrevPage-Down")
--buttonAttributesDecreaseAgility:SetScript("OnMouseUp", function() AIO.Handle("Kaev", "AttributesDecrease", 2) end)

-- Stamina
local fontAttributesStamina = frameAttributes:CreateFontString("fontAttributesStamina")
fontAttributesStamina:SetFont("Fonts\\FRIZQT__.TTF", 15)
fontAttributesStamina:SetSize(137, 5)
fontAttributesStamina:SetPoint("TOPLEFT", -20, -105)
fontAttributesStamina:SetText("|cFF000000Aguante|r")

local fontAttributesStaminaValue = frameAttributes:CreateFontString("fontAttributesStaminaValue")
fontAttributesStaminaValue:SetFont("Fonts\\FRIZQT__.TTF", 15)
fontAttributesStaminaValue:SetSize(50, 5)
fontAttributesStaminaValue:SetPoint("TOPLEFT", 90, -105)

local buttonAttributesIncreaseStamina = CreateFrame("Button", "buttonAttributesIncreaseStamina", frameAttributes, nil)
buttonAttributesIncreaseStamina:SetSize(20, 20)
buttonAttributesIncreaseStamina:SetPoint("TOPLEFT", 144, -99)
buttonAttributesIncreaseStamina:EnableMouse(true)
buttonAttributesIncreaseStamina:SetNormalTexture("Interface/BUTTONS/UI-SpellbookIcon-NextPage-Up")
buttonAttributesIncreaseStamina:SetHighlightTexture("Interface/BUTTONS/UI-Panel-MinimizeButton-Highlight")
buttonAttributesIncreaseStamina:SetPushedTexture("Interface/BUTTONS/UI-SpellbookIcon-NextPage-Down")
buttonAttributesIncreaseStamina:SetScript("OnMouseUp", function() AIO.Handle("Kaev", "AttributesIncrease", 3) end)
       
--local buttonAttributesDecreaseStamina = CreateFrame("Button", "buttonAttributesDecreaseStamina", frameAttributes, nil)
--buttonAttributesDecreaseStamina:SetSize(20, 20)
--buttonAttributesDecreaseStamina:SetPoint("TOPLEFT", 104, -69)
--buttonAttributesDecreaseStamina:EnableMouse(true)
--buttonAttributesDecreaseStamina:SetNormalTexture("Interface/BUTTONS/UI-SpellbookIcon-PrevPage-Up")
--buttonAttributesDecreaseStamina:SetHighlightTexture("Interface/BUTTONS/UI-Panel-MinimizeButton-Highlight")
--buttonAttributesDecreaseStamina:SetPushedTexture("Interface/BUTTONS/UI-SpellbookIcon-PrevPage-Down")
--buttonAttributesDecreaseStamina:SetScript("OnMouseUp", function() AIO.Handle("Kaev", "AttributesDecrease", 3) end)

-- Intellect
local fontAttributesIntellect = frameAttributes:CreateFontString("fontAttributesIntellect")
fontAttributesIntellect:SetFont("Fonts\\FRIZQT__.TTF", 15)
fontAttributesIntellect:SetSize(137, 5)
fontAttributesIntellect:SetPoint("TOPLEFT", -20, -125)
fontAttributesIntellect:SetText("|cFF000000Intelecto|r")

local fontAttributesIntellectValue = frameAttributes:CreateFontString("fontAttributesIntellectValue")
fontAttributesIntellectValue:SetFont("Fonts\\FRIZQT__.TTF", 15)
fontAttributesIntellectValue:SetSize(50, 5)
fontAttributesIntellectValue:SetPoint("TOPLEFT", 90, -125)

local buttonAttributesIncreaseIntellect = CreateFrame("Button", "buttonAttributesIncreaseIntellect", frameAttributes, nil)
buttonAttributesIncreaseIntellect:SetSize(20, 20)
buttonAttributesIncreaseIntellect:SetPoint("TOPLEFT", 144, -119)
buttonAttributesIncreaseIntellect:EnableMouse(true)
buttonAttributesIncreaseIntellect:SetNormalTexture("Interface/BUTTONS/UI-SpellbookIcon-NextPage-Up")
buttonAttributesIncreaseIntellect:SetHighlightTexture("Interface/BUTTONS/UI-Panel-MinimizeButton-Highlight")
buttonAttributesIncreaseIntellect:SetPushedTexture("Interface/BUTTONS/UI-SpellbookIcon-NextPage-Down")
buttonAttributesIncreaseIntellect:SetScript("OnMouseUp", function() AIO.Handle("Kaev", "AttributesIncrease", 4) end)
       
--local buttonAttributesDecreaseIntellect = CreateFrame("Button", "buttonAttributesDecreaseIntellect", frameAttributes, nil)
--buttonAttributesDecreaseIntellect:SetSize(20, 20)
--buttonAttributesDecreaseIntellect:SetPoint("TOPLEFT", 104, -89)
--buttonAttributesDecreaseIntellect:EnableMouse(true)
--buttonAttributesDecreaseIntellect:SetNormalTexture("Interface/BUTTONS/UI-SpellbookIcon-PrevPage-Up")
--buttonAttributesDecreaseIntellect:SetHighlightTexture("Interface/BUTTONS/UI-Panel-MinimizeButton-Highlight")
--buttonAttributesDecreaseIntellect:SetPushedTexture("Interface/BUTTONS/UI-SpellbookIcon-PrevPage-Down")
--buttonAttributesDecreaseIntellect:SetScript("OnMouseUp", function() AIO.Handle("Kaev", "AttributesDecrease", 4) end)

-- Spirit
local fontAttributesSpirit = frameAttributes:CreateFontString("fontAttributesSpirit")
fontAttributesSpirit:SetFont("Fonts\\FRIZQT__.TTF", 15)
fontAttributesSpirit:SetSize(137, 5)
fontAttributesSpirit:SetPoint("TOPLEFT", -20, -145)
fontAttributesSpirit:SetText("|cFF000000Espíritu|r")

local fontAttributesSpiritValue = frameAttributes:CreateFontString("fontAttributesSpiritValue")
fontAttributesSpiritValue:SetFont("Fonts\\FRIZQT__.TTF", 15)
fontAttributesSpiritValue:SetSize(50, 5)
fontAttributesSpiritValue:SetPoint("TOPLEFT", 90, -145)

local buttonAttributesIncreaseSpirit = CreateFrame("Button", "buttonAttributesIncreaseSpirit", frameAttributes, nil)
buttonAttributesIncreaseSpirit:SetSize(20, 20)
buttonAttributesIncreaseSpirit:SetPoint("TOPLEFT", 144, -139)
buttonAttributesIncreaseSpirit:EnableMouse(true)
buttonAttributesIncreaseSpirit:SetNormalTexture("Interface/BUTTONS/UI-SpellbookIcon-NextPage-Up")
buttonAttributesIncreaseSpirit:SetHighlightTexture("Interface/BUTTONS/UI-Panel-MinimizeButton-Highlight")
buttonAttributesIncreaseSpirit:SetPushedTexture("Interface/BUTTONS/UI-SpellbookIcon-NextPage-Down")
buttonAttributesIncreaseSpirit:SetScript("OnMouseUp", function() AIO.Handle("Kaev", "AttributesIncrease", 5) end)



local buttonOpenAlma = CreateFrame("Button", "buttonOpenAlma", Minimap, nil)
buttonOpenAlma:SetSize(50, 50)
buttonOpenAlma:SetPoint("TOPLEFT", -20, -70)
buttonOpenAlma:EnableMouse(true)
buttonOpenAlma:SetNormalTexture("Interface/Minimap/MiniMap-TrackingBorder")
buttonOpenAlma:SetHighlightTexture("Interface/Minimap/MiniMap-TrackingBorderHighlight")
buttonOpenAlma:SetPushedTexture("Interface/Minimap/MiniMap-TrackingBorderDown")
buttonOpenAlma:SetFrameLevel(buttonOpenAlma:GetFrameLevel()+10)

buttonOpenAlma:SetScript("OnEnter", function()
    GameTooltip:SetOwner(this, "ANCHOR_LEFT");
    GameTooltip:AddLine("Puntos de Alma");
    GameTooltip:AddLine("Escribe .alma para mostrar la ventana de puntos de alma.");
    GameTooltip:AddLine("Click izquierdo para mostrar la ventana de pultos de alma.");
    GameTooltip:Show();
end)

buttonOpenAlma:SetScript("OnLeave", function()
    GameTooltip:Hide();
end)

buttonOpenAlma:SetScript("OnMouseUp", function()
    frameAttributes:Show()
end)

local buttonOpenAlmaBG = CreateFrame("Button", "buttonOpenAlmaBG", Minimap, nil)
buttonOpenAlmaBG:SetSize(20, 20)
buttonOpenAlmaBG:SetPoint("TOPLEFT", -15, -75)
buttonOpenAlmaBG:EnableMouse(true)
buttonOpenAlmaBG:SetNormalTexture("Interface/Icons/INV_Enchant_EssenceAstralSmall")




       
--buttonAttributesDecreaseSpirit = CreateFrame("Button", "buttonAttributesDecreaseSpirit", frameAttributes, nil)
--buttonAttributesDecreaseSpirit:SetSize(20, 20)
--buttonAttributesDecreaseSpirit:SetPoint("TOPLEFT", 104, -109)
--buttonAttributesDecreaseSpirit:EnableMouse(true)
--buttonAttributesDecreaseSpirit:SetNormalTexture("Interface/BUTTONS/UI-SpellbookIcon-PrevPage-Up")
--buttonAttributesDecreaseSpirit:SetHighlightTexture("Interface/BUTTONS/UI-Panel-MinimizeButton-Highlight")
--buttonAttributesDecreaseSpirit:SetPushedTexture("Interface/BUTTONS/UI-SpellbookIcon-PrevPage-Down")
--buttonAttributesDecreaseSpirit:SetScript("OnMouseUp", function() AIO.Handle("Kaev", "AttributesDecrease", 5) end)


--local buttonAddSoulPoints = CreateFrame("Button", "buttonAddSoulPoints", frameAttributes, nil)
--buttonAddSoulPoints:SetSize(250, 50)
--buttonAddSoulPoints:SetPoint("TOPLEFT", 20, -209)
--buttonAddSoulPoints:EnableMouse(true)
--buttonAddSoulPoints:SetNormalTexture("Interface/BUTTONS/UI-Panel-Button-Up")
--buttonAddSoulPoints:SetHighlightTexture("UI-Panel-Button-Highlight")
--buttonAddSoulPoints:SetPushedTexture("Interface/BUTTONS/UI-Panel-Button-Down")
--buttonAddSoulPoints:SetScript("OnMouseUp", function() AIO.Handle("Kaev", "AttributesIncrease", 5) end)

local function createButton(frame, text, width, height, left, top, position)
    local button = CreateFrame("Button", "button", frame, nil)
    button:SetPoint(position, left, top)
    button:SetWidth(width)
    button:SetHeight(height)

    button:SetText(text)
    button:SetNormalFontObject("GameFontNormal")

    local ntex = button:CreateTexture()
    ntex:SetTexture("Interface/Buttons/UI-Panel-Button-Up")
    ntex:SetTexCoord(0, 0.625, 0, 0.6875)
    ntex:SetAllPoints() 
    button:SetNormalTexture(ntex)

    local htex = button:CreateTexture()
    htex:SetTexture("Interface/Buttons/UI-Panel-Button-Highlight")
    htex:SetTexCoord(0, 0.625, 0, 0.6875)
    htex:SetAllPoints()
    button:SetHighlightTexture(htex)

    local ptex = button:CreateTexture()
    ptex:SetTexture("Interface/Buttons/UI-Panel-Button-Down")
    ptex:SetTexCoord(0, 0.625, 0, 0.6875)
    ptex:SetAllPoints()
    button:SetPushedTexture(ptex)

    return button
end


local fontPointsValue = frameAttributes:CreateFontString("fontPointsValue")
fontPointsValue:SetFont("Fonts\\FRIZQT__.TTF", 15)
fontPointsValue:SetSize(150, 5)
fontPointsValue:SetPoint("BOTTOM", 0, 115)
fontPointsValue:SetText("|cFF0000001 Punto = 200 Honor|r")

local buttonAddSoulPoints = createButton(frameAttributes, "Comprar un punto", 150, 30, 0, 75, "BOTTOM")

buttonAddSoulPoints:SetScript("OnMouseUp", function() AIO.Handle("Kaev", "AddPoints") end)

local fontPointsResetValue = frameAttributes:CreateFontString("fontPointsResetValue")
fontPointsResetValue:SetFont("Fonts\\FRIZQT__.TTF", 15)
fontPointsResetValue:SetSize(180, 5)
fontPointsResetValue:SetPoint("BOTTOM", 0, 55)
fontPointsResetValue:SetText("|cFF000000Reiniciar = 1000 Honor|r")

local buttonResetSoulPoints = createButton(frameAttributes, "Reiniciar puntos", 150, 30, 0, 15, "BOTTOM")

buttonResetSoulPoints:SetScript("OnMouseUp", function() AIO.Handle("Kaev", "ResetPoints") end)


function MyHandlers.ShowAttributes(player)
    frameAttributes:Show()
end

function MyHandlers.SetStats(player, left, p1, p2, p3, p4, p5)
    fontAttributesStrengthValue:SetText("|cFF000000"..p1.."|r")
    fontAttributesAgilityValue:SetText("|cFF000000"..p2.."|r")
    fontAttributesStaminaValue:SetText("|cFF000000"..p3.."|r")
    fontAttributesIntellectValue:SetText("|cFF000000"..p4.."|r")
    fontAttributesSpiritValue:SetText("|cFF000000"..p5.."|r")
    fontAttributesPointsLeft:SetText("|cFF000000 Puntos disponibles: "..left.."|r")
end