TAC.TableContainsItem = function (items, table, ignoreCase)
    items = items or {}
    table = table or {}
    ignoreCase = ignoreCase or false

    if (string.lower(type(items)) ~= 'table' or
        string.lower(type(table)) ~= 'table') then
        return false
    end

    if (#items <= 0 or #table <= 0) then
        return false
    end

    if (ignoreCase) then
        ignoreCase = true
    else
        ignoreCase = false
    end

    for _, tableItem in pairs(table) do
        for _, item in pairs(items) do
            if (ignoreCase and string.lower(tostring(item)) == string.lower(tostring(tableItem))) then
                return true
            elseif (tostring(item) == tostring(tableItem)) then
                return true
            end
        end
    end

    return false
end

TAC.PrintToUser = function(message)
    print(Ansicolors(message))
end

TAC.PrintToConsole = function(message)
    print(AnsiConsole(message))
end

TAC.RandomString = function(length)
    local result = ''

    for i = 1, length do
        math.randomseed(TAC.ToInt(os.time() / math.random(1, 99)))
        if ((i == 1) or (math.random(0, 100) % 2 == 0)) then
            math.randomseed(TAC.ToInt(os.time() / math.random(1, 99)))
            if (math.random(0, 100) % 2 == 0) then
                math.randomseed(TAC.ToInt(os.time() / math.random(1, 99)))
                result = result .. string.char(math.random(65, 90))
            else
                math.randomseed(TAC.ToInt(os.time() / math.random(1, 99)))
                result = result .. string.char(math.random(97, 122))
            end
        else
            math.randomseed(TAC.ToInt(os.time() / math.random(1, 99)))
            result = result .. string.char(math.random(48, 57))
        end
    end

    return result
end