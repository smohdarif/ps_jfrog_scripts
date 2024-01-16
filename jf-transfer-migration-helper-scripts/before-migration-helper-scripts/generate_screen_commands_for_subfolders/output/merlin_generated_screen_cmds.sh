#!/bin/bash

# Execute screen commands with a maximum of 18 jobs at a time
max_jobs=18

# Define an array of screen commands
screen_commands=(
"mkdir -p output/1; pushd output/1; screen -dmS merlin-session1 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/BMAPExample yes \".conan\" 2>&1 | tee merlin-session1.log; exit' ; popd"
"mkdir -p output/2; pushd output/2; screen -dmS merlin-session2 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/CAAExample yes \".conan\" 2>&1 | tee merlin-session2.log; exit' ; popd"
"mkdir -p output/3; pushd output/3; screen -dmS merlin-session3 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/CastleConanCommon yes \".conan\" 2>&1 | tee merlin-session3.log; exit' ; popd"
"mkdir -p output/4; pushd output/4; screen -dmS merlin-session4 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/CastleConanRecipes yes \".conan\" 2>&1 | tee merlin-session4.log; exit' ; popd"
"mkdir -p output/5; pushd output/5; screen -dmS merlin-session5 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/CastleFrontDoorUtility yes \".conan\" 2>&1 | tee merlin-session5.log; exit' ; popd"
"mkdir -p output/6; pushd output/6; screen -dmS merlin-session6 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/ConanTemplate yes \".conan\" 2>&1 | tee merlin-session6.log; exit' ; popd"
"mkdir -p output/7; pushd output/7; screen -dmS merlin-session7 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/DataCollectionSchema yes \".conan\" 2>&1 | tee merlin-session7.log; exit' ; popd"
"mkdir -p output/8; pushd output/8; screen -dmS merlin-session8 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/DefaultProduct yes \".conan\" 2>&1 | tee merlin-session8.log; exit' ; popd"
"mkdir -p output/9; pushd output/9; screen -dmS merlin-session9 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/Edelman yes \".conan\" 2>&1 | tee merlin-session9.log; exit' ; popd"
"mkdir -p output/10; pushd output/10; screen -dmS merlin-session10 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/EdelmanManufacturing yes \".conan\" 2>&1 | tee merlin-session10.log; exit' ; popd"
"mkdir -p output/11; pushd output/11; screen -dmS merlin-session11 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/Lizzo yes \".conan\" 2>&1 | tee merlin-session11.log; exit' ; popd"
"mkdir -p output/12; pushd output/12; screen -dmS merlin-session12 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/LizzoCase yes \".conan\" 2>&1 | tee merlin-session12.log; exit' ; popd"
"mkdir -p output/13; pushd output/13; screen -dmS merlin-session13 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/LizzoChargingCase yes \".conan\" 2>&1 | tee merlin-session13.log; exit' ; popd"
"mkdir -p output/14; pushd output/14; screen -dmS merlin-session14 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/LizzoManufacturing yes \".conan\" 2>&1 | tee merlin-session14.log; exit' ; popd"
"mkdir -p output/15; pushd output/15; screen -dmS merlin-session15 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/LizzoManufacturingImage yes \".conan\" 2>&1 | tee merlin-session15.log; exit' ; popd"
"mkdir -p output/16; pushd output/16; screen -dmS merlin-session16 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/LoneStarr yes \".conan\" 2>&1 | tee merlin-session16.log; exit' ; popd"
"mkdir -p output/17; pushd output/17; screen -dmS merlin-session17 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/LoneStarrManufacturing yes \".conan\" 2>&1 | tee merlin-session17.log; exit' ; popd"
"mkdir -p output/18; pushd output/18; screen -dmS merlin-session18 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/LoneStarr_Demo yes \".conan\" 2>&1 | tee merlin-session18.log; exit' ; popd"
"mkdir -p output/19; pushd output/19; screen -dmS merlin-session19 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/Mathers yes \".conan\" 2>&1 | tee merlin-session19.log; exit' ; popd"
"mkdir -p output/20; pushd output/20; screen -dmS merlin-session20 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/QualcommProjectFilesGenerator yes \".conan\" 2>&1 | tee merlin-session20.log; exit' ; popd"
"mkdir -p output/21; pushd output/21; screen -dmS merlin-session21 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/Scotty yes \".conan\" 2>&1 | tee merlin-session21.log; exit' ; popd"
"mkdir -p output/22; pushd output/22; screen -dmS merlin-session22 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/ScottyCaseManufacturing yes \".conan\" 2>&1 | tee merlin-session22.log; exit' ; popd"
"mkdir -p output/23; pushd output/23; screen -dmS merlin-session23 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/ScottyManufacturing yes \".conan\" 2>&1 | tee merlin-session23.log; exit' ; popd"
"mkdir -p output/24; pushd output/24; screen -dmS merlin-session24 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/Scotty_Charging_Case yes \".conan\" 2>&1 | tee merlin-session24.log; exit' ; popd"
"mkdir -p output/25; pushd output/25; screen -dmS merlin-session25 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/Serena yes \".conan\" 2>&1 | tee merlin-session25.log; exit' ; popd"
"mkdir -p output/26; pushd output/26; screen -dmS merlin-session26 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/SerenaCardigan yes \".conan\" 2>&1 | tee merlin-session26.log; exit' ; popd"
"mkdir -p output/27; pushd output/27; screen -dmS merlin-session27 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/SerenaCaseManufacturing yes \".conan\" 2>&1 | tee merlin-session27.log; exit' ; popd"
"mkdir -p output/28; pushd output/28; screen -dmS merlin-session28 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/SerenaManufacturing yes \".conan\" 2>&1 | tee merlin-session28.log; exit' ; popd"
"mkdir -p output/29; pushd output/29; screen -dmS merlin-session29 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/Serena_Charging_Case yes \".conan\" 2>&1 | tee merlin-session29.log; exit' ; popd"
"mkdir -p output/30; pushd output/30; screen -dmS merlin-session30 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/Smalls yes \".conan\" 2>&1 | tee merlin-session30.log; exit' ; popd"
"mkdir -p output/31; pushd output/31; screen -dmS merlin-session31 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/SmallsCaseManufacturing yes \".conan\" 2>&1 | tee merlin-session31.log; exit' ; popd"
"mkdir -p output/32; pushd output/32; screen -dmS merlin-session32 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/SmallsManufacturing yes \".conan\" 2>&1 | tee merlin-session32.log; exit' ; popd"
"mkdir -p output/33; pushd output/33; screen -dmS merlin-session33 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/Smalls_Charging_Case yes \".conan\" 2>&1 | tee merlin-session33.log; exit' ; popd"
"mkdir -p output/34; pushd output/34; screen -dmS merlin-session34 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/Spitfire yes \".conan\" 2>&1 | tee merlin-session34.log; exit' ; popd"
"mkdir -p output/35; pushd output/35; screen -dmS merlin-session35 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/SpitfireAirohaHAL yes \".conan\" 2>&1 | tee merlin-session35.log; exit' ; popd"
"mkdir -p output/36; pushd output/36; screen -dmS merlin-session36 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/SpitfireAirohaToolchain yes \".conan\" 2>&1 | tee merlin-session36.log; exit' ; popd"
"mkdir -p output/37; pushd output/37; screen -dmS merlin-session37 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/SpitfireAudio yes \".conan\" 2>&1 | tee merlin-session37.log; exit' ; popd"
"mkdir -p output/38; pushd output/38; screen -dmS merlin-session38 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/SpitfireAudioAutomation yes \".conan\" 2>&1 | tee merlin-session38.log; exit' ; popd"
"mkdir -p output/39; pushd output/39; screen -dmS merlin-session39 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/SpitfireAudioPath yes \".conan\" 2>&1 | tee merlin-session39.log; exit' ; popd"
"mkdir -p output/40; pushd output/40; screen -dmS merlin-session40 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/SpitfireAutomation yes \".conan\" 2>&1 | tee merlin-session40.log; exit' ; popd"
"mkdir -p output/41; pushd output/41; screen -dmS merlin-session41 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/SpitfireBMAP yes \".conan\" 2>&1 | tee merlin-session41.log; exit' ; popd"
"mkdir -p output/42; pushd output/42; screen -dmS merlin-session42 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/SpitfireBMS yes \".conan\" 2>&1 | tee merlin-session42.log; exit' ; popd"
"mkdir -p output/43; pushd output/43; screen -dmS merlin-session43 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/SpitfireBTTestComponent yes \".conan\" 2>&1 | tee merlin-session43.log; exit' ; popd"
"mkdir -p output/44; pushd output/44; screen -dmS merlin-session44 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/SpitfireBatteryManager yes \".conan\" 2>&1 | tee merlin-session44.log; exit' ; popd"
"mkdir -p output/45; pushd output/45; screen -dmS merlin-session45 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/SpitfireBatteryManagerAPI yes \".conan\" 2>&1 | tee merlin-session45.log; exit' ; popd"
"mkdir -p output/46; pushd output/46; screen -dmS merlin-session46 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/SpitfireBluetooth yes \".conan\" 2>&1 | tee merlin-session46.log; exit' ; popd"
"mkdir -p output/47; pushd output/47; screen -dmS merlin-session47 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/SpitfireButtons yes \".conan\" 2>&1 | tee merlin-session47.log; exit' ; popd"
"mkdir -p output/48; pushd output/48; screen -dmS merlin-session48 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/SpitfireCIM yes \".conan\" 2>&1 | tee merlin-session48.log; exit' ; popd"
"mkdir -p output/49; pushd output/49; screen -dmS merlin-session49 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/SpitfireCore yes \".conan\" 2>&1 | tee merlin-session49.log; exit' ; popd"
"mkdir -p output/50; pushd output/50; screen -dmS merlin-session50 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/SpitfireCoreServices yes \".conan\" 2>&1 | tee merlin-session50.log; exit' ; popd"
"mkdir -p output/51; pushd output/51; screen -dmS merlin-session51 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/SpitfireCypress yes \".conan\" 2>&1 | tee merlin-session51.log; exit' ; popd"
"mkdir -p output/52; pushd output/52; screen -dmS merlin-session52 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/SpitfireDSP yes \".conan\" 2>&1 | tee merlin-session52.log; exit' ; popd"
"mkdir -p output/53; pushd output/53; screen -dmS merlin-session53 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/SpitfireDataCollection yes \".conan\" 2>&1 | tee merlin-session53.log; exit' ; popd"
"mkdir -p output/54; pushd output/54; screen -dmS merlin-session54 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/SpitfireDataCollectionSchemas yes \".conan\" 2>&1 | tee merlin-session54.log; exit' ; popd"
"mkdir -p output/55; pushd output/55; screen -dmS merlin-session55 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/SpitfireDataHarvesting yes \".conan\" 2>&1 | tee merlin-session55.log; exit' ; popd"
"mkdir -p output/56; pushd output/56; screen -dmS merlin-session56 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/SpitfireDiagnostics yes \".conan\" 2>&1 | tee merlin-session56.log; exit' ; popd"
"mkdir -p output/57; pushd output/57; screen -dmS merlin-session57 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/SpitfireGoogleFeatures yes \".conan\" 2>&1 | tee merlin-session57.log; exit' ; popd"
"mkdir -p output/58; pushd output/58; screen -dmS merlin-session58 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/SpitfireHDMA yes \".conan\" 2>&1 | tee merlin-session58.log; exit' ; popd"
"mkdir -p output/59; pushd output/59; screen -dmS merlin-session59 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/SpitfireHelloText yes \".conan\" 2>&1 | tee merlin-session59.log; exit' ; popd"
"mkdir -p output/60; pushd output/60; screen -dmS merlin-session60 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/SpitfireHelloWorld yes \".conan\" 2>&1 | tee merlin-session60.log; exit' ; popd"
"mkdir -p output/61; pushd output/61; screen -dmS merlin-session61 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/SpitfireIAP2 yes \".conan\" 2>&1 | tee merlin-session61.log; exit' ; popd"
"mkdir -p output/62; pushd output/62; screen -dmS merlin-session62 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/SpitfireLED yes \".conan\" 2>&1 | tee merlin-session62.log; exit' ; popd"
"mkdir -p output/63; pushd output/63; screen -dmS merlin-session63 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/SpitfireMainExample yes \".conan\" 2>&1 | tee merlin-session63.log; exit' ; popd"
"mkdir -p output/64; pushd output/64; screen -dmS merlin-session64 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/SpitfireManufacturing yes \".conan\" 2>&1 | tee merlin-session64.log; exit' ; popd"
"mkdir -p output/65; pushd output/65; screen -dmS merlin-session65 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/SpitfireMbedtls yes \".conan\" 2>&1 | tee merlin-session65.log; exit' ; popd"
"mkdir -p output/66; pushd output/66; screen -dmS merlin-session66 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/SpitfireMediaPlayer yes \".conan\" 2>&1 | tee merlin-session66.log; exit' ; popd"
"mkdir -p output/67; pushd output/67; screen -dmS merlin-session67 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/SpitfireMetaBuild yes \".conan\" 2>&1 | tee merlin-session67.log; exit' ; popd"
"mkdir -p output/68; pushd output/68; screen -dmS merlin-session68 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/SpitfireNanopb yes \".conan\" 2>&1 | tee merlin-session68.log; exit' ; popd"
"mkdir -p output/69; pushd output/69; screen -dmS merlin-session69 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/SpitfirePhysicalStateManager yes \".conan\" 2>&1 | tee merlin-session69.log; exit' ; popd"
"mkdir -p output/70; pushd output/70; screen -dmS merlin-session70 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/SpitfirePowerManager yes \".conan\" 2>&1 | tee merlin-session70.log; exit' ; popd"
"mkdir -p output/71; pushd output/71; screen -dmS merlin-session71 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/SpitfireProductBehaviour yes \".conan\" 2>&1 | tee merlin-session71.log; exit' ; popd"
"mkdir -p output/72; pushd output/72; screen -dmS merlin-session72 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/SpitfireQCC51xx_audio yes \".conan\" 2>&1 | tee merlin-session72.log; exit' ; popd"
"mkdir -p output/73; pushd output/73; screen -dmS merlin-session73 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/SpitfireQCC51xx_bluetooth yes \".conan\" 2>&1 | tee merlin-session73.log; exit' ; popd"
"mkdir -p output/74; pushd output/74; screen -dmS merlin-session74 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/SpitfireQCC51xx_os yes \".conan\" 2>&1 | tee merlin-session74.log; exit' ; popd"
"mkdir -p output/75; pushd output/75; screen -dmS merlin-session75 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/SpitfireQCC51xx_synergy yes \".conan\" 2>&1 | tee merlin-session75.log; exit' ; popd"
"mkdir -p output/76; pushd output/76; screen -dmS merlin-session76 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/SpitfireQCC51xx_system yes \".conan\" 2>&1 | tee merlin-session76.log; exit' ; popd"
"mkdir -p output/77; pushd output/77; screen -dmS merlin-session77 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/SpitfireSTM32L4HAL yes \".conan\" 2>&1 | tee merlin-session77.log; exit' ; popd"
"mkdir -p output/78; pushd output/78; screen -dmS merlin-session78 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/SpitfireSTM32L4SDK yes \".conan\" 2>&1 | tee merlin-session78.log; exit' ; popd"
"mkdir -p output/79; pushd output/79; screen -dmS merlin-session79 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/SpitfireSTM32U5HAL yes \".conan\" 2>&1 | tee merlin-session79.log; exit' ; popd"
"mkdir -p output/80; pushd output/80; screen -dmS merlin-session80 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/SpitfireSTMToolchain yes \".conan\" 2>&1 | tee merlin-session80.log; exit' ; popd"
"mkdir -p output/81; pushd output/81; screen -dmS merlin-session81 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/SpitfireSecurity yes \".conan\" 2>&1 | tee merlin-session81.log; exit' ; popd"
"mkdir -p output/82; pushd output/82; screen -dmS merlin-session82 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/SpitfireSecurityTools yes \".conan\" 2>&1 | tee merlin-session82.log; exit' ; popd"
"mkdir -p output/83; pushd output/83; screen -dmS merlin-session83 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/SpitfireSensor yes \".conan\" 2>&1 | tee merlin-session83.log; exit' ; popd"
"mkdir -p output/84; pushd output/84; screen -dmS merlin-session84 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/SpitfireSensorSubsystem yes \".conan\" 2>&1 | tee merlin-session84.log; exit' ; popd"
"mkdir -p output/85; pushd output/85; screen -dmS merlin-session85 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/SpitfireSmartANR yes \".conan\" 2>&1 | tee merlin-session85.log; exit' ; popd"
"mkdir -p output/86; pushd output/86; screen -dmS merlin-session86 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/SpitfireSoundManagement yes \".conan\" 2>&1 | tee merlin-session86.log; exit' ; popd"
"mkdir -p output/87; pushd output/87; screen -dmS merlin-session87 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/SpitfireSpotifyTap yes \".conan\" 2>&1 | tee merlin-session87.log; exit' ; popd"
"mkdir -p output/88; pushd output/88; screen -dmS merlin-session88 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/SpitfireStrepplusHAL yes \".conan\" 2>&1 | tee merlin-session88.log; exit' ; popd"
"mkdir -p output/89; pushd output/89; screen -dmS merlin-session89 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/SpitfireStrepplusToolchain yes \".conan\" 2>&1 | tee merlin-session89.log; exit' ; popd"
"mkdir -p output/90; pushd output/90; screen -dmS merlin-session90 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/SpitfireTelephony yes \".conan\" 2>&1 | tee merlin-session90.log; exit' ; popd"
"mkdir -p output/91; pushd output/91; screen -dmS merlin-session91 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/SpitfireTemplate yes \".conan\" 2>&1 | tee merlin-session91.log; exit' ; popd"
"mkdir -p output/92; pushd output/92; screen -dmS merlin-session92 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/SpitfireTestComponent yes \".conan\" 2>&1 | tee merlin-session92.log; exit' ; popd"
"mkdir -p output/93; pushd output/93; screen -dmS merlin-session93 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/SpitfireTestEmulation yes \".conan\" 2>&1 | tee merlin-session93.log; exit' ; popd"
"mkdir -p output/94; pushd output/94; screen -dmS merlin-session94 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/SpitfireToolchain yes \".conan\" 2>&1 | tee merlin-session94.log; exit' ; popd"
"mkdir -p output/95; pushd output/95; screen -dmS merlin-session95 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/SpitfireTools yes \".conan\" 2>&1 | tee merlin-session95.log; exit' ; popd"
"mkdir -p output/96; pushd output/96; screen -dmS merlin-session96 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/SpitfireUIEngine yes \".conan\" 2>&1 | tee merlin-session96.log; exit' ; popd"
"mkdir -p output/97; pushd output/97; screen -dmS merlin-session97 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/SpitfireUSBPowerDelivery yes \".conan\" 2>&1 | tee merlin-session97.log; exit' ; popd"
"mkdir -p output/98; pushd output/98; screen -dmS merlin-session98 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/SpitfireUpdate yes \".conan\" 2>&1 | tee merlin-session98.log; exit' ; popd"
"mkdir -p output/99; pushd output/99; screen -dmS merlin-session99 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/SpitfireUtilities yes \".conan\" 2>&1 | tee merlin-session99.log; exit' ; popd"
"mkdir -p output/100; pushd output/100; screen -dmS merlin-session100 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/SpitfireWalnutHAL yes \".conan\" 2>&1 | tee merlin-session100.log; exit' ; popd"
"mkdir -p output/101; pushd output/101; screen -dmS merlin-session101 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/SpitfireWalnutToolchain yes \".conan\" 2>&1 | tee merlin-session101.log; exit' ; popd"
"mkdir -p output/102; pushd output/102; screen -dmS merlin-session102 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/SpitfireWindowsToolchain yes \".conan\" 2>&1 | tee merlin-session102.log; exit' ; popd"
"mkdir -p output/103; pushd output/103; screen -dmS merlin-session103 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/SpitfireX86_64HAL yes \".conan\" 2>&1 | tee merlin-session103.log; exit' ; popd"
"mkdir -p output/104; pushd output/104; screen -dmS merlin-session104 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/Spitfirex86_64Toolchain yes \".conan\" 2>&1 | tee merlin-session104.log; exit' ; popd"
"mkdir -p output/105; pushd output/105; screen -dmS merlin-session105 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/castle-conan-recipes yes \".conan\" 2>&1 | tee merlin-session105.log; exit' ; popd"
"mkdir -p output/106; pushd output/106; screen -dmS merlin-session106 bash -c '/app/sureshv/migrate_n_subfolders_in_parallel.sh usvartifactory5 merlin jfrogio merlin yes BoseCorp/catch2 yes \".conan\" 2>&1 | tee merlin-session106.log; exit' ; popd"
)

# Execute screen commands as background jobs
i=0
for screen_command in "${screen_commands[@]}"; do
    # Start the screen command in the background
    eval "$screen_command" &
    
    # Check the count of running screen sessions
    session_count=$(screen -ls | awk '/\.merlin-/{print $1}'| wc -l)


    
    # If the maximum number of jobs is reached, wait for any job to finish
    while ((session_count >= max_jobs)); do
        sleep 1
        session_count=$(screen -ls | awk '/\.merlin-/{print $1}'| wc -l)
    done


done

# Wait for all remaining jobs to complete
wait

# Additional cleanup or post-processing commands can go here