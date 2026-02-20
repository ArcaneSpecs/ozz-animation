#!/bin/bash
set -euo pipefail

pushd "$(dirname "$0")/" > /dev/null

# rm *.ozz

# cp ~/dev/WyvernEngineOdin/engine/assets/models/test_model/*.glb .
# cp ~/Documents/Wyvern_Projects/RPG/Content/Models/Fox/Fox_from_blender.glb .
# ./build/src/animation/offline/gltf/gltf2ozz --file=Test_Character.glb
./build/src/animation/offline/gltf/gltf2ozz --file="$1"
# ./build/src/animation/offline/gltf/gltf2ozz --file=Fox_from_unreal.glb
# ./build/src/animation/offline/gltf/gltf2ozz --file=Fox.glb
# mv Anim_1.ozz Testing.ozz

mv skeleton.ozz our_skeleton.ozz
mv our_skeleton.ozz build/samples/skinning/media
mv Wind.ozz build/samples/skinning/media
# mv Run.ozz Testing.ozz
# mv Take\ 001.ozz Testing.ozz

# cp *.ozz ~/Documents/Wyvern_Projects/RPG/Content/Models/Proto
# rm *.ozz

popd > /dev/null

