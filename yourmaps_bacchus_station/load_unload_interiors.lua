


Citizen.CreateThread(function()

    local ipls = {{
        hash = GetHashKey("bac_i_11_01_int_milo"),
        coords = vector3(582.00714, 1676.2395, 190.02344)
    }}

    while true do

        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)

        for k, v in pairs(ipls) do

            local distance = #(coords - v.coords)

            if distance < 125 and not IsImapActive(v.hash) then
                RequestImap(v.hash)
                print("LOADING: bacchus_station_active")
            end

            if distance > 150 and IsImapActive(v.hash) then
                RemoveImap(v.hash)
                print("UNLOADING: bacchus_station_inactive")
            end
            Wait(100)
        end

        Citizen.Wait(1000)

    end
end)