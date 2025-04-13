🧠 STICKS – Dev Summary & Long-Term Goals
✅ Primary Game Vision
A scalable, dopamine-driven stick collection game with:

Randomly generated sticks (color, material, traits, enchantments, spirits, rarity, shape, size)

Player progression: levels, titles, coins, unlockables

Combat-ready architecture for future PvP/PvE

High polish & replayability through rarity, FX, events, and dopamine feedback

🎯 Core Systems (✅ = implemented, ⚠️ = WIP)
System	Status	Notes
Stick Generation (2-Phase: Base → Finalize)	✅	Works as expected
Color & Material Application	⚠️	Material still bugged
Random Model Selection (shape skewed by rarity)	✅	Needs model weighting fine-tune
Size Variety (with scaling)	✅	Sizing logic works
Attachment Points (GripPoint, EffectOrigin)	✅	Implemented across all models
Inventory & Pickup Logic	✅	Finalize after pickup confirmation
Event Support (e.g. color/material overrides)	⚠️	Design-ready, not yet active
Enchant / Spirit Visual FX	⏳	Will use FX on EffectOrigin
Combat Ready Architecture	⏳	All sticks will have universal grip system
Particle Effect Management	⏳	Attach FX to EffectOrigin
Equip Animation System	⏳	Future idea: anime-style equip cut-in
DataStore / Save System	✅	Player inventories persist
🗂️ Dev File Structure
Scripts are organized under folders (Modules/, Server/, etc.)

Stick models live in ReplicatedStorage > Assets > StickModels > [Category]

All stick models use:

✅ PrimaryPart: Handle

✅ Attachments: GripPoint, EffectOrigin

🧾 Game Design Rules
Rarity = dynamically calculated based on traits, enchant, spirit, shape, & size bonus

All sticks must be:

Spawned visually first (GenerateBaseStick)

Finalized with game data (FinalizeStick) only if picked up

Event overrides must allow easy injection of:

Color palette

Material pool

Rarity weight tweaks

Special FX

🛠️ Immediate Fixes (as of last session)
 Fix Material not applying correctly to FBX imported meshes

 Ensure Basic models are 60%+ of spawn weight (too many Fancy currently)

 Add safe fallback if ModelID fails (prevent nil crashes)

 Ensure scaling affects Handle properly (size is working, but double check visuals)

 Finalize stick reveal system

 Prepare coin reward system (for pickup, events, selling, etc.)
  16:59:39.621  > local function printDescendants(object, indent)
	indent = indent or ""
	for _, child in ipairs(object:GetChildren()) do
		local typeName = child:IsA("ModuleScript") or child:IsA("Script") or child:IsA("LocalScript") and "Script" or child.ClassName
		local info = string.format("%s├─ %s (%s)", indent, child.Name, typeName)
		print(info)
		printDescendants(child, indent .. "│  ")
	end
end

print("📂 Full Game Hierarchy:")
printDescendants(game)
  -  Studio
  16:59:39.622  📂 Full Game Hierarchy:  -  Edit
  16:59:39.622  ├─ Workspace (Workspace)  -  Edit
  16:59:39.622  │  ├─ Baseplate (Part)  -  Edit
  16:59:39.622  │  │  ├─ Texture (Texture)  -  Edit
  16:59:39.622  │  ├─ Terrain (Terrain)  -  Edit
  16:59:39.622  │  ├─ SpawnLocation (SpawnLocation)  -  Edit
  16:59:39.622  │  │  ├─ Decal (Decal)  -  Edit
  16:59:39.622  │  ├─ StickSpawnArea (Folder)  -  Edit
  16:59:39.622  │  │  ├─ SpawnLocation (Part)  -  Edit
  16:59:39.622  │  │  │  ├─ Highlight (Highlight)  -  Edit
  16:59:39.622  │  │  ├─ SpawnLocation (Part)  -  Edit
  16:59:39.622  │  │  │  ├─ Highlight (Highlight)  -  Edit
  16:59:39.622  │  │  ├─ SpawnLocation (Part)  -  Edit
  16:59:39.622  │  │  │  ├─ Highlight (Highlight)  -  Edit
  16:59:39.622  │  │  ├─ SpawnLocation (Part)  -  Edit
  16:59:39.622  │  │  │  ├─ Highlight (Highlight)  -  Edit
  16:59:39.623  │  │  ├─ SpawnLocation (Part)  -  Edit
  16:59:39.623  │  │  │  ├─ Highlight (Highlight)  -  Edit
  16:59:39.623  │  │  ├─ SpawnLocation (Part)  -  Edit
  16:59:39.623  │  │  │  ├─ Highlight (Highlight)  -  Edit
  16:59:39.623  │  ├─ Camera (Camera)  -  Edit
  16:59:39.623  ├─ Run Service (RunService)  -  Edit
  16:59:39.623  ├─ GuiService (GuiService)  -  Edit
  16:59:39.623  │  ├─ ScreenshotHud (ScreenshotHud)  -  Edit
  16:59:39.623  ├─ Stats (Stats)  -  Edit
  16:59:39.623  │  ├─ PerformanceStats (StatsItem)  -  Edit
  16:59:39.623  │  │  ├─ Memory (StatsItem)  -  Edit
  16:59:39.623  │  │  │  ├─ CoreMemory (StatsItem)  -  Edit
  16:59:39.623  │  │  │  │  ├─ default (StatsItem)  -  Edit
  16:59:39.623  │  │  │  │  ├─ staticinit (StatsItem)  -  Edit
  16:59:39.623  │  │  │  │  ├─ internal/TaskScheduler (StatsItem)  -  Edit
  16:59:39.623  │  │  │  │  ├─ profiler (StatsItem)  -  Edit
  16:59:39.623  │  │  │  │  ├─ internal/RbxThread (StatsItem)  -  Edit
  16:59:39.623  │  │  │  │  ├─ telemetry/analytics (StatsItem)  -  Edit
  16:59:39.623  │  │  │  │  ├─ telemetry (StatsItem)  -  Edit
  16:59:39.623  │  │  │  │  ├─ render/geometryGenerator (StatsItem)  -  Edit
  16:59:39.623  │  │  │  │  ├─ render/material/misc (StatsItem)  -  Edit
  16:59:39.623  │  │  │  │  ├─ render/texture/local (StatsItem)  -  Edit
  16:59:39.623  │  │  │  │  ├─ render/texture/fallback (StatsItem)  -  Edit
  16:59:39.623  │  │  │  │  ├─ render/texture/loading (StatsItem)  -  Edit
  16:59:39.623  │  │  │  │  ├─ render/perform/textureGc (StatsItem)  -  Edit
  16:59:39.624  │  │  │  │  ├─ render/prepare/textureManager (StatsItem)  -  Edit
  16:59:39.624  │  │  │  │  ├─ render/perform/textureManager (StatsItem)  -  Edit
  16:59:39.624  │  │  │  │  ├─ render/perform/materialMisc (StatsItem)  -  Edit
  16:59:39.624  │  │  │  │  ├─ render/perform/materialGc (StatsItem)  -  Edit
  16:59:39.624  │  │  │  │  ├─ render/material/failsafe (StatsItem)  -  Edit
  16:59:39.624  │  │  │  │  ├─ render/meshManager/async (StatsItem)  -  Edit
  16:59:39.624  │  │  │  │  ├─ render/fastCluster/prepareSkinning (StatsItem)  -  Edit
  16:59:39.624  │  │  │  │  ├─ render/fastCluster/skinningReserve (StatsItem)  -  Edit
  16:59:39.624  │  │  │  │  ├─ textureRef (StatsItem)  -  Edit
  16:59:39.624  │  │  │  │  ├─ render/prepare/tc (StatsItem)  -  Edit
  16:59:39.624  │  │  │  │  ├─ dynamic/texture (StatsItem)  -  Edit
  16:59:39.624  │  │  │  │  ├─ render/target (StatsItem)  -  Edit
  16:59:39.624  │  │  │  │  ├─ render/target/pooled (StatsItem)  -  Edit
  16:59:39.624  │  │  │  │  ├─ render/perform/zpre (StatsItem)  -  Edit
  16:59:39.624  │  │  │  │  ├─ render/clouds (StatsItem)  -  Edit
  16:59:39.624  │  │  │  │  ├─ render/ssao (StatsItem)  -  Edit
  16:59:39.624  │  │  │  │  ├─ render/glow (StatsItem)  -  Edit
  16:59:39.624  │  │  │  │  ├─ render/sunrays (StatsItem)  -  Edit
  16:59:39.624  │  │  │  │  ├─ render/dof (StatsItem)  -  Edit
  16:59:39.624  │  │  │  │  ├─ render/blur (StatsItem)  -  Edit
  16:59:39.624  │  │  │  │  ├─ render/colorCorrection (StatsItem)  -  Edit
  16:59:39.625  │  │  │  │  ├─ render/highlight (StatsItem)  -  Edit
  16:59:39.625  │  │  │  │  ├─ render/RtPool (StatsItem)  -  Edit
  16:59:39.625  │  │  │  │  ├─ render/mainRts (StatsItem)  -  Edit
  16:59:39.625  │  │  │  │  ├─ render/ui (StatsItem)  -  Edit
  16:59:39.625  │  │  │  │  ├─ render/lightgrid (StatsItem)  -  Edit
  16:59:39.625  │  │  │  │  ├─ render/system (StatsItem)  -  Edit
  16:59:39.625  │  │  │  │  ├─ render/bindworkspace (StatsItem)  -  Edit
  16:59:39.625  │  │  │  │  ├─ render/adorn (StatsItem)  -  Edit
  16:59:39.625  │  │  │  │  ├─ render/perform/statistics (StatsItem)  -  Edit
  16:59:39.625  │  │  │  │  ├─ render/gpu_geom_mgr (StatsItem)  -  Edit
  16:59:39.625  │  │  │  │  ├─ render/prepare/sceneUpdater (StatsItem)  -  Edit
  16:59:39.625  │  │  │  │  ├─ render/prepare/parts (StatsItem)  -  Edit
  16:59:39.625  │  │  │  │  ├─ render/prepare/megaCluster (StatsItem)  -  Edit
  16:59:39.625  │  │  │  │  ├─ render/prepare/attachments (StatsItem)  -  Edit
  16:59:39.625  │  │  │  │  ├─ render/envmap (StatsItem)  -  Edit
  16:59:39.625  │  │  │  │  ├─ render/viewportFrames (StatsItem)  -  Edit
  16:59:39.625  │  │  │  │  ├─ render/perform/scratchFB (StatsItem)  -  Edit
  16:59:39.625  │  │  │  │  ├─ render/perform/cullableScene (StatsItem)  -  Edit
  16:59:39.625  │  │  │  │  ├─ render/vertexstreamer (StatsItem)  -  Edit
  16:59:39.625  │  │  │  │  ├─ render/instanceglob (StatsItem)  -  Edit
  16:59:39.625  │  │  │  │  ├─ render/sky (StatsItem)  -  Edit
  16:59:39.625  │  │  │  │  ├─ render/advsky (StatsItem)  -  Edit
  16:59:39.625  │  │  │  │  ├─ render/prepare/lightObject (StatsItem)  -  Edit
  16:59:39.625  │  │  │  │  ├─ render/prepare/motionBuffer (StatsItem)  -  Edit
  16:59:39.625  │  │  │  │  ├─ render/shadowmap (StatsItem)  -  Edit
  16:59:39.625  │  │  │  │  ├─ render/perform/shadowmap (StatsItem)  -  Edit
  16:59:39.625  │  │  │  │  ├─ render/shadowmap/depthcache (StatsItem)  -  Edit
  16:59:39.625  │  │  │  │  ├─ render/perform/terrain (StatsItem)  -  Edit
  16:59:39.625  │  │  │  │  ├─ render/prepare/terrain (StatsItem)  -  Edit
  16:59:39.626  │  │  │  │  ├─ render/perform/textureAtlasInsert (StatsItem)  -  Edit
  16:59:39.626  │  │  │  │  ├─ dynamic/mesh (StatsItem)  -  Edit
  16:59:39.626  │  │  │  │  ├─ render/prepare/beamNode (StatsItem)  -  Edit
  16:59:39.626  │  │  │  │  ├─ render/prepare/customEmitter (StatsItem)  -  Edit
  16:59:39.626  │  │  │  │  ├─ render/prepare/lightGridChunk (StatsItem)  -  Edit
  16:59:39.626  │  │  │  │  ├─ render/perform/lightGrid (StatsItem)  -  Edit
  16:59:39.626  │  │  │  │  ├─ render/terrain/async/chunkGen (StatsItem)  -  Edit
  16:59:39.626  │  │  │  │  ├─ render/perform/terrain/occlusionGen (StatsItem)  -  Edit
  16:59:39.626  │  │  │  │  ├─ render/terrain/grass/async (StatsItem)  -  Edit
  16:59:39.626  │  │  │  │  ├─ render/terrain/grass (StatsItem)  -  Edit
  16:59:39.626  │  │  │  │  ├─ render/prepare/terrain/grass (StatsItem)  -  Edit
  16:59:39.626  │  │  │  │  ├─ languageServices/async (StatsItem)  -  Edit
  16:59:39.626  │  │  │  │  ├─ languageServices/generic (StatsItem)  -  Edit
  16:59:39.626  │  │  │  │  ├─ languageServices/shadow (StatsItem)  -  Edit
  16:59:39.626  │  │  │  │  ├─ network/replicationCoalescing (StatsItem)  -  Edit
  16:59:39.626  │  │  │  │  ├─ network/sharedQueue (StatsItem)  -  Edit
  16:59:39.626  │  │  │  │  ├─ network/megaReplicationData (StatsItem)  -  Edit
  16:59:39.626  │  │  │  │  ├─ network/replicator (StatsItem)  -  Edit
  16:59:39.626  │  │  │  │  ├─ network/replicatedInstances (StatsItem)  -  Edit
  16:59:39.626  │  │  │  │  ├─ network/deferredtrees (StatsItem)  -  Edit
  16:59:39.626  │  │  │  │  ├─ network/streamingSolver (StatsItem)  -  Edit
  16:59:39.626  │  │  │  │  ├─ network/streamingReplication (StatsItem)  -  Edit
  16:59:39.626  │  │  │  │  ├─ network/touchReplication (StatsItem)  -  Edit
  16:59:39.626  │  │  │  │  ├─ network/ISR (StatsItem)  -  Edit
  16:59:39.626  │  │  │  │  ├─ network/ISR/Connection (StatsItem)  -  Edit
  16:59:39.626  │  │  │  │  ├─ network/ISR/Prioritization (StatsItem)  -  Edit
  16:59:39.627  │  │  │  │  ├─ network/streamingGC (StatsItem)  -  Edit
  16:59:39.627  │  │  │  │  ├─ network/replicationDataCache (StatsItem)  -  Edit
  16:59:39.627  │  │  │  │  ├─ network/replicationDataCachePendingList (StatsItem)  -  Edit
  16:59:39.627  │  │  │  │  ├─ network/streamingObserver (StatsItem)  -  Edit
  16:59:39.627  │  │  │  │  ├─ network/ISR/groupMan (StatsItem)  -  Edit
  16:59:39.627  │  │  │  │  ├─ network/physicsSenderCache (StatsItem)  -  Edit
  16:59:39.627  │  │  │  │  ├─ network/ISR/Property (StatsItem)  -  Edit
  16:59:39.627  │  │  │  │  ├─ network/objectsMemory (StatsItem)  -  Edit
  16:59:39.627  │  │  │  │  ├─ network/ISR/Replicator (StatsItem)  -  Edit
  16:59:39.627  │  │  │  │  ├─ raknet/raknet (StatsItem)  -  Edit
  16:59:39.627  │  │  │  │  ├─ render/prepare/physics (StatsItem)  -  Edit
  16:59:39.627  │  │  │  │  ├─ internal/ScriptContext (StatsItem)  -  Edit
  16:59:39.627  │  │  │  │  ├─ internal/Humanoid (StatsItem)  -  Edit
  16:59:39.627  │  │  │  │  ├─ lua/bytecode (StatsItem)  -  Edit
  16:59:39.627  │  │  │  │  ├─ lua/codegen (StatsItem)  -  Edit
  16:59:39.627  │  │  │  │  ├─ lua/codegenpages (StatsItem)  -  Edit
  16:59:39.627  │  │  │  │  ├─ wrap/layeredDeformer (StatsItem)  -  Edit
  16:59:39.627  │  │  │  │  ├─ internal/RuntimeScriptService (StatsItem)  -  Edit
  16:59:39.627  │  │  │  │  ├─ wrap/hsr (StatsItem)  -  Edit
  16:59:39.627  │  │  │  │  ├─ temporaryCageMeshProvider/save (StatsItem)  -  Edit
  16:59:39.627  │  │  │  │  ├─ animation/skeleton (StatsItem)  -  Edit
  16:59:39.627  │  │  │  │  ├─ animation/skeleton_watcher (StatsItem)  -  Edit
  16:59:39.627  │  │  │  │  ├─ CoreScriptTelemetry (StatsItem)  -  Edit
  16:59:39.627  │  │  │  │  ├─ internal/ixp (StatsItem)  -  Edit
  16:59:39.628  │  │  │  │  ├─ http/batch (StatsItem)  -  Edit
  16:59:39.628  │  │  │  │  ├─ contentProvider/asyncDecryption (StatsItem)  -  Edit
  16:59:39.628  │  │  │  │  ├─ lua/web-cache (StatsItem)  -  Edit
  16:59:39.628  │  │  │  │  ├─ ads/AdGui (StatsItem)  -  Edit
  16:59:39.628  │  │  │  │  ├─ internal/MarketplaceService (StatsItem)  -  Edit
  16:59:39.628  │  │  │  │  ├─ physics/broadphase (StatsItem)  -  Edit
  16:59:39.628  │  │  │  │  ├─ physics/midphase (StatsItem)  -  Edit
  16:59:39.628  │  │  │  │  ├─ physics/aerodynamics/mesh (StatsItem)  -  Edit
  16:59:39.628  │  │  │  │  ├─ physics/aerodynamics/integrator (StatsItem)  -  Edit
  16:59:39.628  │  │  │  │  ├─ physics/aerodynamics/cpintegrator (StatsItem)  -  Edit
  16:59:39.628  │  │  │  │  ├─ physics/aerodynamics/shinterpolator (StatsItem)  -  Edit
  16:59:39.628  │  │  │  │  ├─ physics/aerodynamics/reducedmesh (StatsItem)  -  Edit
  16:59:39.628  │  │  │  │  ├─ physics/solver (StatsItem)  -  Edit
  16:59:39.628  │  │  │  │  ├─ video/texture (StatsItem)  -  Edit
  16:59:39.628  │  │  │  │  ├─ video/default (StatsItem)  -  Edit
  16:59:39.628  │  │  │  │  ├─ internal/localization (StatsItem)  -  Edit
  16:59:39.628  │  │  │  │  ├─ internal/localizationTable (StatsItem)  -  Edit
  16:59:39.629  │  │  │  │  ├─ internal/DataModelGenericJob (StatsItem)  -  Edit
  16:59:39.629  │  │  │  │  ├─ internal/GlobalSettings (StatsItem)  -  Edit
  16:59:39.629  │  │  │  │  ├─ internal/Workspace (StatsItem)  -  Edit
  16:59:39.629  │  │  │  │  ├─ studio/undo (StatsItem)  -  Edit
  16:59:39.629  │  │  │  │  ├─ CollectionService (StatsItem)  -  Edit
  16:59:39.629  │  │  │  │  ├─ sound/async (StatsItem)  -  Edit
  16:59:39.629  │  │  │  │  ├─ sound/acoustics (StatsItem)  -  Edit
  16:59:39.629  │  │  │  │  ├─ internal/CSGDictionary (StatsItem)  -  Edit
  16:59:39.629  │  │  │  │  ├─ internal/HttpRbxApiService (StatsItem)  -  Edit
  16:59:39.629  │  │  │  │  ├─ geometry/EditableImage (StatsItem)  -  Edit
  16:59:39.629  │  │  │  │  ├─ internal/ChatService (StatsItem)  -  Edit
  16:59:39.629  │  │  │  │  ├─ internal/LogService (StatsItem)  -  Edit
  16:59:39.629  │  │  │  │  ├─ performanceStats (StatsItem)  -  Edit
  16:59:39.629  │  │  │  │  ├─ internal/RemoteFunction (StatsItem)  -  Edit
  16:59:39.629  │  │  │  │  ├─ datastore/cache (StatsItem)  -  Edit
  16:59:39.629  │  │  │  │  ├─ internal/StarterPlayer (StatsItem)  -  Edit
  16:59:39.629  │  │  │  │  ├─ gui/Uncategorized (StatsItem)  -  Edit
  16:59:39.629  │  │  │  │  ├─ render/fonts (StatsItem)  -  Edit
  16:59:39.630  │  │  │  │  ├─ gui/FreeType (StatsItem)  -  Edit
  16:59:39.630  │  │  │  │  ├─ gui/UIQuadTree (StatsItem)  -  Edit
  16:59:39.630  │  │  │  │  ├─ gui/HarfBuzz (StatsItem)  -  Edit
  16:59:39.630  │  │  │  │  ├─ physics/step (StatsItem)  -  Edit
  16:59:39.630  │  │  │  │  ├─ physics/buffers (StatsItem)  -  Edit
  16:59:39.630  │  │  │  │  ├─ physics/transient (StatsItem)  -  Edit
  16:59:39.630  │  │  │  │  ├─ instance/fullname (StatsItem)  -  Edit
  16:59:39.630  │  │  │  │  ├─ render/copy (StatsItem)  -  Edit
  16:59:39.630  │  │  │  │  ├─ render/vertexlayout (StatsItem)  -  Edit
  16:59:39.630  │  │  │  │  ├─ render/shader (StatsItem)  -  Edit
  16:59:39.630  │  │  │  │  ├─ render/swapchain (StatsItem)  -  Edit
  16:59:39.630  │  │  │  │  ├─ AudioWiring (StatsItem)  -  Edit
  16:59:39.630  │  │  │  │  ├─ internal/DataModelPatch (StatsItem)  -  Edit
  16:59:39.630  │  │  │  │  ├─ geometry/EditableMesh/Geometry (StatsItem)  -  Edit
  16:59:39.630  │  │  │  │  ├─ geometry/EditableMesh/SpatialCache (StatsItem)  -  Edit
  16:59:39.630  │  │  │  │  ├─ geometry/EditableMesh/GpuAssigned (StatsItem)  -  Edit
  16:59:39.630  │  │  │  │  ├─ gui/FontData (StatsItem)  -  Edit
  16:59:39.630  │  │  │  │  ├─ fontProvider/loading (StatsItem)  -  Edit
  16:59:39.630  │  │  │  │  ├─ gui/TextLayout (StatsItem)  -  Edit
  16:59:39.630  │  │  │  │  ├─ sound/default (StatsItem)  -  Edit
  16:59:39.630  │  │  │  │  ├─ sound/voicechat (StatsItem)  -  Edit
  16:59:39.630  │  │  │  │  ├─ sound/voicechat2 (StatsItem)  -  Edit
  16:59:39.630  │  │  │  │  ├─ AssetProvider/total (StatsItem)  -  Edit
  16:59:39.630  │  │  │  │  ├─ AssetProvider/state (StatsItem)  -  Edit
  16:59:39.630  │  │  │  │  ├─ AssetProvider/other (StatsItem)  -  Edit
  16:59:39.630  │  │  │  │  ├─ AppCore/GuidRegistry (StatsItem)  -  Edit
  16:59:39.631  │  │  │  │  ├─ video/codec (StatsItem)  -  Edit
  16:59:39.631  │  │  │  │  ├─ video/packet (StatsItem)  -  Edit
  16:59:39.631  │  │  │  │  ├─ internal/PerformanceControl (StatsItem)  -  Edit
  16:59:39.631  │  │  │  │  ├─ physics/bullet (StatsItem)  -  Edit
  16:59:39.631  │  │  │  │  ├─ telemetry/fields_container (StatsItem)  -  Edit
  16:59:39.631  │  │  │  │  ├─ telemetry/event (StatsItem)  -  Edit
  16:59:39.631  │  │  │  │  ├─ telemetry/counter (StatsItem)  -  Edit
  16:59:39.631  │  │  │  │  ├─ telemetry/stat (StatsItem)  -  Edit
  16:59:39.631  │  │  │  │  ├─ telemetry/v2_try_cut_and_send (StatsItem)  -  Edit
  16:59:39.631  │  │  │  │  ├─ telemetry/v2_send_batch (StatsItem)  -  Edit
  16:59:39.631  │  │  │  │  ├─ http/curl (StatsItem)  -  Edit
  16:59:39.631  │  │  │  │  ├─ http/requestcallback (StatsItem)  -  Edit
  16:59:39.631  │  │  │  │  ├─ http/client (StatsItem)  -  Edit
  16:59:39.631  │  │  │  │  ├─ openssl (StatsItem)  -  Edit
  16:59:39.631  │  │  │  │  ├─ http/wslay (StatsItem)  -  Edit
  16:59:39.631  │  │  │  │  ├─ SQLite (StatsItem)  -  Edit
  16:59:39.631  │  │  │  │  ├─ localstorage (StatsItem)  -  Edit
  16:59:39.631  │  │  │  │  ├─ internal/BaseThreadPool (StatsItem)  -  Edit
  16:59:39.631  │  │  │  │  ├─ studio/plugin/preload (StatsItem)  -  Edit
  16:59:39.631  │  │  │  │  ├─ studio/plugin/buffering (StatsItem)  -  Edit
  16:59:39.631  │  │  │  │  ├─ render/prepare (StatsItem)  -  Edit
  16:59:39.631  │  │  │  │  ├─ render/prepare/adorn (StatsItem)  -  Edit
  16:59:39.631  │  │  │  │  ├─ render/perform (StatsItem)  -  Edit
  16:59:39.631  │  │  │  │  ├─ render/perform/adorn (StatsItem)  -  Edit
  16:59:39.631  │  │  │  │  ├─ render/glyphaatlas/ugc (StatsItem)  -  Edit
  16:59:39.631  │  │  │  │  ├─ render/glyphatlas/core (StatsItem)  -  Edit
  16:59:39.631  │  │  │  │  ├─ experienceStateCaptureService (StatsItem)  -  Edit
  16:59:39.632  │  │  │  │  ├─ render/terrain/heightmapImporter (StatsItem)  -  Edit
  16:59:39.632  │  │  │  ├─ PlaceMemory (StatsItem)  -  Edit
  16:59:39.632  │  │  │  │  ├─ HttpCache (StatsItem)  -  Edit
  16:59:39.632  │  │  │  │  ├─ Instances (StatsItem)  -  Edit
  16:59:39.632  │  │  │  │  ├─ Signals (StatsItem)  -  Edit
  16:59:39.632  │  │  │  │  ├─ LuaHeap (StatsItem)  -  Edit
  16:59:39.632  │  │  │  │  ├─ Script (StatsItem)  -  Edit
  16:59:39.632  │  │  │  │  ├─ PhysicsCollision (StatsItem)  -  Edit
  16:59:39.632  │  │  │  │  ├─ PhysicsParts (StatsItem)  -  Edit
  16:59:39.632  │  │  │  │  ├─ GraphicsSolidModels (StatsItem)  -  Edit
  16:59:39.632  │  │  │  │  ├─ GraphicsHSR (StatsItem)  -  Edit
  16:59:39.632  │  │  │  │  ├─ GraphicsMeshParts (StatsItem)  -  Edit
  16:59:39.632  │  │  │  │  ├─ GraphicsParticles (StatsItem)  -  Edit
  16:59:39.632  │  │  │  │  ├─ GraphicsParts (StatsItem)  -  Edit
  16:59:39.632  │  │  │  │  ├─ GraphicsSpatialHash (StatsItem)  -  Edit
  16:59:39.632  │  │  │  │  ├─ GraphicsTerrain (StatsItem)  -  Edit
  16:59:39.632  │  │  │  │  ├─ GraphicsTexture (StatsItem)  -  Edit
  16:59:39.632  │  │  │  │  ├─ GraphicsTextureCharacter (StatsItem)  -  Edit
  16:59:39.632  │  │  │  │  ├─ Sounds (StatsItem)  -  Edit
  16:59:39.632  │  │  │  │  ├─ TerrainVoxels (StatsItem)  -  Edit
  16:59:39.632  │  │  │  │  ├─ TerrainPhysics (StatsItem)  -  Edit
  16:59:39.632  │  │  │  │  ├─ Gui (StatsItem)  -  Edit
  16:59:39.632  │  │  │  │  ├─ Animation (StatsItem)  -  Edit
  16:59:39.632  │  │  │  │  ├─ Navigation (StatsItem)  -  Edit
  16:59:39.632  │  │  │  │  ├─ GeometryCSG (StatsItem)  -  Edit
  16:59:39.632  │  │  │  ├─ UntrackedMemory (StatsItem)  -  Edit
  16:59:39.632  │  │  │  ├─ PlaceScriptMemory (StatsItem)  -  Edit
  16:59:39.632  │  │  │  │  ├─ MemoryCategory_0 (StatsItem)  -  Edit
  16:59:39.632  │  │  │  │  ├─ MemoryCategory_1 (StatsItem)  -  Edit
  16:59:39.632  │  │  │  │  ├─ MemoryCategory_2 (StatsItem)  -  Edit
  16:59:39.632  │  │  │  │  ├─ MemoryCategory_3 (StatsItem)  -  Edit
  16:59:39.632  │  │  │  │  ├─ MemoryCategory_4 (StatsItem)  -  Edit
  16:59:39.633  │  │  │  │  ├─ MemoryCategory_5 (StatsItem)  -  Edit
  16:59:39.633  │  │  │  │  ├─ MemoryCategory_6 (StatsItem)  -  Edit
  16:59:39.633  │  │  │  │  ├─ MemoryCategory_7 (StatsItem)  -  Edit
  16:59:39.633  │  │  │  │  ├─ MemoryCategory_8 (StatsItem)  -  Edit
  16:59:39.633  │  │  │  │  ├─ MemoryCategory_9 (StatsItem)  -  Edit
  16:59:39.633  │  │  │  │  ├─ MemoryCategory_10 (StatsItem)  -  Edit
  16:59:39.633  │  │  │  │  ├─ MemoryCategory_11 (StatsItem)  -  Edit
  16:59:39.633  │  │  │  │  ├─ MemoryCategory_12 (StatsItem)  -  Edit
  16:59:39.633  │  │  │  │  ├─ MemoryCategory_13 (StatsItem)  -  Edit
  16:59:39.633  │  │  │  │  ├─ MemoryCategory_14 (StatsItem)  -  Edit
  16:59:39.633  │  │  │  │  ├─ MemoryCategory_15 (StatsItem)  -  Edit
  16:59:39.633  │  │  │  │  ├─ MemoryCategory_16 (StatsItem)  -  Edit
  16:59:39.633  │  │  │  │  ├─ MemoryCategory_17 (StatsItem)  -  Edit
  16:59:39.633  │  │  │  │  ├─ MemoryCategory_18 (StatsItem)  -  Edit
  16:59:39.633  │  │  │  │  ├─ MemoryCategory_19 (StatsItem)  -  Edit
  16:59:39.633  │  │  │  │  ├─ MemoryCategory_20 (StatsItem)  -  Edit
  16:59:39.633  │  │  │  │  ├─ MemoryCategory_21 (StatsItem)  -  Edit
  16:59:39.633  │  │  │  │  ├─ MemoryCategory_22 (StatsItem)  -  Edit
  16:59:39.633  │  │  │  │  ├─ MemoryCategory_23 (StatsItem)  -  Edit
  16:59:39.633  │  │  │  │  ├─ MemoryCategory_24 (StatsItem)  -  Edit
  16:59:39.633  │  │  │  │  ├─ MemoryCategory_25 (StatsItem)  -  Edit
  16:59:39.633  │  │  │  │  ├─ MemoryCategory_26 (StatsItem)  -  Edit
  16:59:39.633  │  │  │  │  ├─ MemoryCategory_27 (StatsItem)  -  Edit
  16:59:39.633  │  │  │  │  ├─ MemoryCategory_28 (StatsItem)  -  Edit
  16:59:39.633  │  │  │  │  ├─ MemoryCategory_29 (StatsItem)  -  Edit
  16:59:39.633  │  │  │  │  ├─ MemoryCategory_30 (StatsItem)  -  Edit
  16:59:39.633  │  │  │  │  ├─ MemoryCategory_31 (StatsItem)  -  Edit
  16:59:39.633  │  │  │  │  ├─ MemoryCategory_32 (StatsItem)  -  Edit
  16:59:39.633  │  │  │  │  ├─ MemoryCategory_33 (StatsItem)  -  Edit
  16:59:39.633  │  │  │  │  ├─ MemoryCategory_34 (StatsItem)  -  Edit
  16:59:39.633  │  │  │  │  ├─ MemoryCategory_35 (StatsItem)  -  Edit
  16:59:39.633  │  │  │  │  ├─ MemoryCategory_36 (StatsItem)  -  Edit
  16:59:39.634  │  │  │  │  ├─ MemoryCategory_37 (StatsItem)  -  Edit
  16:59:39.634  │  │  │  │  ├─ MemoryCategory_38 (StatsItem)  -  Edit
  16:59:39.634  │  │  │  │  ├─ MemoryCategory_39 (StatsItem)  -  Edit
  16:59:39.634  │  │  │  │  ├─ MemoryCategory_40 (StatsItem)  -  Edit
  16:59:39.634  │  │  │  │  ├─ MemoryCategory_41 (StatsItem)  -  Edit
  16:59:39.634  │  │  │  │  ├─ MemoryCategory_42 (StatsItem)  -  Edit
  16:59:39.634  │  │  │  │  ├─ MemoryCategory_43 (StatsItem)  -  Edit
  16:59:39.634  │  │  │  │  ├─ MemoryCategory_44 (StatsItem)  -  Edit
  16:59:39.634  │  │  │  │  ├─ MemoryCategory_45 (StatsItem)  -  Edit
  16:59:39.634  │  │  │  │  ├─ MemoryCategory_46 (StatsItem)  -  Edit
  16:59:39.634  │  │  │  │  ├─ MemoryCategory_47 (StatsItem)  -  Edit
  16:59:39.634  │  │  │  │  ├─ MemoryCategory_48 (StatsItem)  -  Edit
  16:59:39.634  │  │  │  │  ├─ MemoryCategory_49 (StatsItem)  -  Edit
  16:59:39.634  │  │  │  │  ├─ MemoryCategory_50 (StatsItem)  -  Edit
  16:59:39.634  │  │  │  │  ├─ MemoryCategory_51 (StatsItem)  -  Edit
  16:59:39.634  │  │  │  │  ├─ MemoryCategory_52 (StatsItem)  -  Edit
  16:59:39.634  │  │  │  │  ├─ MemoryCategory_53 (StatsItem)  -  Edit
  16:59:39.634  │  │  │  │  ├─ MemoryCategory_54 (StatsItem)  -  Edit
  16:59:39.634  │  │  │  │  ├─ MemoryCategory_55 (StatsItem)  -  Edit
  16:59:39.634  │  │  │  │  ├─ MemoryCategory_56 (StatsItem)  -  Edit
  16:59:39.634  │  │  │  │  ├─ MemoryCategory_57 (StatsItem)  -  Edit
  16:59:39.634  │  │  │  │  ├─ MemoryCategory_58 (StatsItem)  -  Edit
  16:59:39.634  │  │  │  │  ├─ MemoryCategory_59 (StatsItem)  -  Edit
  16:59:39.634  │  │  │  │  ├─ MemoryCategory_60 (StatsItem)  -  Edit
  16:59:39.634  │  │  │  │  ├─ MemoryCategory_61 (StatsItem)  -  Edit
  16:59:39.634  │  │  │  │  ├─ MemoryCategory_62 (StatsItem)  -  Edit
  16:59:39.634  │  │  │  │  ├─ MemoryCategory_63 (StatsItem)  -  Edit
  16:59:39.634  │  │  │  │  ├─ MemoryCategory_64 (StatsItem)  -  Edit
  16:59:39.634  │  │  │  │  ├─ MemoryCategory_65 (StatsItem)  -  Edit
  16:59:39.635  │  │  │  │  ├─ MemoryCategory_66 (StatsItem)  -  Edit
  16:59:39.635  │  │  │  │  ├─ MemoryCategory_67 (StatsItem)  -  Edit
  16:59:39.635  │  │  │  │  ├─ MemoryCategory_68 (StatsItem)  -  Edit
  16:59:39.635  │  │  │  │  ├─ MemoryCategory_69 (StatsItem)  -  Edit
  16:59:39.635  │  │  │  │  ├─ MemoryCategory_70 (StatsItem)  -  Edit
  16:59:39.635  │  │  │  │  ├─ MemoryCategory_71 (StatsItem)  -  Edit
  16:59:39.635  │  │  │  │  ├─ MemoryCategory_72 (StatsItem)  -  Edit
  16:59:39.635  │  │  │  │  ├─ MemoryCategory_73 (StatsItem)  -  Edit
  16:59:39.635  │  │  │  │  ├─ MemoryCategory_74 (StatsItem)  -  Edit
  16:59:39.635  │  │  │  │  ├─ MemoryCategory_75 (StatsItem)  -  Edit
  16:59:39.635  │  │  │  │  ├─ MemoryCategory_76 (StatsItem)  -  Edit
  16:59:39.635  │  │  │  │  ├─ MemoryCategory_77 (StatsItem)  -  Edit
  16:59:39.635  │  │  │  │  ├─ MemoryCategory_78 (StatsItem)  -  Edit
  16:59:39.635  │  │  │  │  ├─ MemoryCategory_79 (StatsItem)  -  Edit
  16:59:39.635  │  │  │  │  ├─ MemoryCategory_80 (StatsItem)  -  Edit
  16:59:39.635  │  │  │  │  ├─ MemoryCategory_81 (StatsItem)  -  Edit
  16:59:39.635  │  │  │  │  ├─ MemoryCategory_82 (StatsItem)  -  Edit
  16:59:39.635  │  │  │  │  ├─ MemoryCategory_83 (StatsItem)  -  Edit
  16:59:39.635  │  │  │  │  ├─ MemoryCategory_84 (StatsItem)  -  Edit
  16:59:39.635  │  │  │  │  ├─ MemoryCategory_85 (StatsItem)  -  Edit
  16:59:39.635  │  │  │  │  ├─ MemoryCategory_86 (StatsItem)  -  Edit
  16:59:39.635  │  │  │  │  ├─ MemoryCategory_87 (StatsItem)  -  Edit
  16:59:39.635  │  │  │  │  ├─ MemoryCategory_88 (StatsItem)  -  Edit
  16:59:39.635  │  │  │  │  ├─ MemoryCategory_89 (StatsItem)  -  Edit
  16:59:39.635  │  │  │  │  ├─ MemoryCategory_90 (StatsItem)  -  Edit
  16:59:39.635  │  │  │  │  ├─ MemoryCategory_91 (StatsItem)  -  Edit
  16:59:39.635  │  │  │  │  ├─ MemoryCategory_92 (StatsItem)  -  Edit
  16:59:39.635  │  │  │  │  ├─ MemoryCategory_93 (StatsItem)  -  Edit
  16:59:39.635  │  │  │  │  ├─ MemoryCategory_94 (StatsItem)  -  Edit
  16:59:39.635  │  │  │  │  ├─ MemoryCategory_95 (StatsItem)  -  Edit
  16:59:39.636  │  │  │  │  ├─ MemoryCategory_96 (StatsItem)  -  Edit
  16:59:39.636  │  │  │  │  ├─ MemoryCategory_97 (StatsItem)  -  Edit
  16:59:39.636  │  │  │  │  ├─ MemoryCategory_98 (StatsItem)  -  Edit
  16:59:39.636  │  │  │  │  ├─ MemoryCategory_99 (StatsItem)  -  Edit
  16:59:39.636  │  │  │  │  ├─ MemoryCategory_100 (StatsItem)  -  Edit
  16:59:39.636  │  │  │  │  ├─ MemoryCategory_101 (StatsItem)  -  Edit
  16:59:39.636  │  │  │  │  ├─ MemoryCategory_102 (StatsItem)  -  Edit
  16:59:39.636  │  │  │  │  ├─ MemoryCategory_103 (StatsItem)  -  Edit
  16:59:39.636  │  │  │  │  ├─ MemoryCategory_104 (StatsItem)  -  Edit
  16:59:39.636  │  │  │  │  ├─ MemoryCategory_105 (StatsItem)  -  Edit
  16:59:39.636  │  │  │  │  ├─ MemoryCategory_106 (StatsItem)  -  Edit
  16:59:39.636  │  │  │  │  ├─ MemoryCategory_107 (StatsItem)  -  Edit
  16:59:39.636  │  │  │  │  ├─ MemoryCategory_108 (StatsItem)  -  Edit
  16:59:39.636  │  │  │  │  ├─ MemoryCategory_109 (StatsItem)  -  Edit
  16:59:39.636  │  │  │  │  ├─ MemoryCategory_110 (StatsItem)  -  Edit
  16:59:39.636  │  │  │  │  ├─ MemoryCategory_111 (StatsItem)  -  Edit
  16:59:39.636  │  │  │  │  ├─ MemoryCategory_112 (StatsItem)  -  Edit
  16:59:39.636  │  │  │  │  ├─ MemoryCategory_113 (StatsItem)  -  Edit
  16:59:39.636  │  │  │  │  ├─ MemoryCategory_114 (StatsItem)  -  Edit
  16:59:39.636  │  │  │  │  ├─ MemoryCategory_115 (StatsItem)  -  Edit
  16:59:39.636  │  │  │  │  ├─ MemoryCategory_116 (StatsItem)  -  Edit
  16:59:39.636  │  │  │  │  ├─ MemoryCategory_117 (StatsItem)  -  Edit
  16:59:39.636  │  │  │  │  ├─ MemoryCategory_118 (StatsItem)  -  Edit
  16:59:39.636  │  │  │  │  ├─ MemoryCategory_119 (StatsItem)  -  Edit
  16:59:39.636  │  │  │  │  ├─ MemoryCategory_120 (StatsItem)  -  Edit
  16:59:39.636  │  │  │  │  ├─ MemoryCategory_121 (StatsItem)  -  Edit
  16:59:39.636  │  │  │  │  ├─ MemoryCategory_122 (StatsItem)  -  Edit
  16:59:39.636  │  │  │  │  ├─ MemoryCategory_123 (StatsItem)  -  Edit
  16:59:39.637  │  │  │  │  ├─ MemoryCategory_124 (StatsItem)  -  Edit
  16:59:39.637  │  │  │  │  ├─ MemoryCategory_125 (StatsItem)  -  Edit
  16:59:39.637  │  │  │  │  ├─ MemoryCategory_126 (StatsItem)  -  Edit
  16:59:39.637  │  │  │  │  ├─ MemoryCategory_127 (StatsItem)  -  Edit
  16:59:39.637  │  │  │  │  ├─ MemoryCategory_128 (StatsItem)  -  Edit
  16:59:39.637  │  │  │  │  ├─ MemoryCategory_129 (StatsItem)  -  Edit
  16:59:39.637  │  │  │  │  ├─ MemoryCategory_130 (StatsItem)  -  Edit
  16:59:39.637  │  │  │  │  ├─ MemoryCategory_131 (StatsItem)  -  Edit
  16:59:39.637  │  │  │  │  ├─ MemoryCategory_132 (StatsItem)  -  Edit
  16:59:39.637  │  │  │  │  ├─ MemoryCategory_133 (StatsItem)  -  Edit
  16:59:39.637  │  │  │  │  ├─ MemoryCategory_134 (StatsItem)  -  Edit
  16:59:39.637  │  │  │  │  ├─ MemoryCategory_135 (StatsItem)  -  Edit
  16:59:39.637  │  │  │  │  ├─ MemoryCategory_136 (StatsItem)  -  Edit
  16:59:39.637  │  │  │  │  ├─ MemoryCategory_137 (StatsItem)  -  Edit
  16:59:39.637  │  │  │  │  ├─ MemoryCategory_138 (StatsItem)  -  Edit
  16:59:39.637  │  │  │  │  ├─ MemoryCategory_139 (StatsItem)  -  Edit
  16:59:39.637  │  │  │  │  ├─ MemoryCategory_140 (StatsItem)  -  Edit
  16:59:39.637  │  │  │  │  ├─ MemoryCategory_141 (StatsItem)  -  Edit
  16:59:39.637  │  │  │  │  ├─ MemoryCategory_142 (StatsItem)  -  Edit
  16:59:39.637  │  │  │  │  ├─ MemoryCategory_143 (StatsItem)  -  Edit
  16:59:39.637  │  │  │  │  ├─ MemoryCategory_144 (StatsItem)  -  Edit
  16:59:39.637  │  │  │  │  ├─ MemoryCategory_145 (StatsItem)  -  Edit
  16:59:39.637  │  │  │  │  ├─ MemoryCategory_146 (StatsItem)  -  Edit
  16:59:39.637  │  │  │  │  ├─ MemoryCategory_147 (StatsItem)  -  Edit
  16:59:39.638  │  │  │  │  ├─ MemoryCategory_148 (StatsItem)  -  Edit
  16:59:39.638  │  │  │  │  ├─ MemoryCategory_149 (StatsItem)  -  Edit
  16:59:39.638  │  │  │  │  ├─ MemoryCategory_150 (StatsItem)  -  Edit
  16:59:39.638  │  │  │  │  ├─ MemoryCategory_151 (StatsItem)  -  Edit
  16:59:39.638  │  │  │  │  ├─ MemoryCategory_152 (StatsItem)  -  Edit
  16:59:39.638  │  │  │  │  ├─ MemoryCategory_153 (StatsItem)  -  Edit
  16:59:39.638  │  │  │  │  ├─ MemoryCategory_154 (StatsItem)  -  Edit
  16:59:39.638  │  │  │  │  ├─ MemoryCategory_155 (StatsItem)  -  Edit
  16:59:39.638  │  │  │  │  ├─ MemoryCategory_156 (StatsItem)  -  Edit
  16:59:39.638  │  │  │  │  ├─ MemoryCategory_157 (StatsItem)  -  Edit
  16:59:39.638  │  │  │  │  ├─ MemoryCategory_158 (StatsItem)  -  Edit
  16:59:39.638  │  │  │  │  ├─ MemoryCategory_159 (StatsItem)  -  Edit
  16:59:39.638  │  │  │  │  ├─ MemoryCategory_160 (StatsItem)  -  Edit
  16:59:39.638  │  │  │  │  ├─ MemoryCategory_161 (StatsItem)  -  Edit
  16:59:39.638  │  │  │  │  ├─ MemoryCategory_162 (StatsItem)  -  Edit
  16:59:39.638  │  │  │  │  ├─ MemoryCategory_163 (StatsItem)  -  Edit
  16:59:39.638  │  │  │  │  ├─ MemoryCategory_164 (StatsItem)  -  Edit
  16:59:39.638  │  │  │  │  ├─ MemoryCategory_165 (StatsItem)  -  Edit
  16:59:39.638  │  │  │  │  ├─ MemoryCategory_166 (StatsItem)  -  Edit
  16:59:39.638  │  │  │  │  ├─ MemoryCategory_167 (StatsItem)  -  Edit
  16:59:39.638  │  │  │  │  ├─ MemoryCategory_168 (StatsItem)  -  Edit
  16:59:39.638  │  │  │  │  ├─ MemoryCategory_169 (StatsItem)  -  Edit
  16:59:39.638  │  │  │  │  ├─ MemoryCategory_170 (StatsItem)  -  Edit
  16:59:39.638  │  │  │  │  ├─ MemoryCategory_171 (StatsItem)  -  Edit
  16:59:39.638  │  │  │  │  ├─ MemoryCategory_172 (StatsItem)  -  Edit
  16:59:39.638  │  │  │  │  ├─ MemoryCategory_173 (StatsItem)  -  Edit
  16:59:39.638  │  │  │  │  ├─ MemoryCategory_174 (StatsItem)  -  Edit
  16:59:39.638  │  │  │  │  ├─ MemoryCategory_175 (StatsItem)  -  Edit
  16:59:39.639  │  │  │  │  ├─ MemoryCategory_176 (StatsItem)  -  Edit
  16:59:39.639  │  │  │  │  ├─ MemoryCategory_177 (StatsItem)  -  Edit
  16:59:39.639  │  │  │  │  ├─ MemoryCategory_178 (StatsItem)  -  Edit
  16:59:39.639  │  │  │  │  ├─ MemoryCategory_179 (StatsItem)  -  Edit
  16:59:39.639  │  │  │  │  ├─ MemoryCategory_180 (StatsItem)  -  Edit
  16:59:39.639  │  │  │  │  ├─ MemoryCategory_181 (StatsItem)  -  Edit
  16:59:39.639  │  │  │  │  ├─ MemoryCategory_182 (StatsItem)  -  Edit
  16:59:39.639  │  │  │  │  ├─ MemoryCategory_183 (StatsItem)  -  Edit
  16:59:39.639  │  │  │  │  ├─ MemoryCategory_184 (StatsItem)  -  Edit
  16:59:39.639  │  │  │  │  ├─ MemoryCategory_185 (StatsItem)  -  Edit
  16:59:39.639  │  │  │  │  ├─ MemoryCategory_186 (StatsItem)  -  Edit
  16:59:39.639  │  │  │  │  ├─ MemoryCategory_187 (StatsItem)  -  Edit
  16:59:39.639  │  │  │  │  ├─ MemoryCategory_188 (StatsItem)  -  Edit
  16:59:39.639  │  │  │  │  ├─ MemoryCategory_189 (StatsItem)  -  Edit
  16:59:39.639  │  │  │  │  ├─ MemoryCategory_190 (StatsItem)  -  Edit
  16:59:39.639  │  │  │  │  ├─ MemoryCategory_191 (StatsItem)  -  Edit
  16:59:39.639  │  │  │  │  ├─ MemoryCategory_192 (StatsItem)  -  Edit
  16:59:39.639  │  │  │  │  ├─ MemoryCategory_193 (StatsItem)  -  Edit
  16:59:39.639  │  │  │  │  ├─ MemoryCategory_194 (StatsItem)  -  Edit
  16:59:39.639  │  │  │  │  ├─ MemoryCategory_195 (StatsItem)  -  Edit
  16:59:39.639  │  │  │  │  ├─ MemoryCategory_196 (StatsItem)  -  Edit
  16:59:39.639  │  │  │  │  ├─ MemoryCategory_197 (StatsItem)  -  Edit
  16:59:39.639  │  │  │  │  ├─ MemoryCategory_198 (StatsItem)  -  Edit
  16:59:39.639  │  │  │  │  ├─ MemoryCategory_199 (StatsItem)  -  Edit
  16:59:39.639  │  │  │  │  ├─ MemoryCategory_200 (StatsItem)  -  Edit
  16:59:39.639  │  │  │  │  ├─ MemoryCategory_201 (StatsItem)  -  Edit
  16:59:39.639  │  │  │  │  ├─ MemoryCategory_202 (StatsItem)  -  Edit
  16:59:39.639  │  │  │  │  ├─ MemoryCategory_203 (StatsItem)  -  Edit
  16:59:39.640  │  │  │  │  ├─ MemoryCategory_204 (StatsItem)  -  Edit
  16:59:39.640  │  │  │  │  ├─ MemoryCategory_205 (StatsItem)  -  Edit
  16:59:39.640  │  │  │  │  ├─ MemoryCategory_206 (StatsItem)  -  Edit
  16:59:39.640  │  │  │  │  ├─ MemoryCategory_207 (StatsItem)  -  Edit
  16:59:39.640  │  │  │  │  ├─ MemoryCategory_208 (StatsItem)  -  Edit
  16:59:39.640  │  │  │  │  ├─ MemoryCategory_209 (StatsItem)  -  Edit
  16:59:39.640  │  │  │  │  ├─ MemoryCategory_210 (StatsItem)  -  Edit
  16:59:39.640  │  │  │  │  ├─ MemoryCategory_211 (StatsItem)  -  Edit
  16:59:39.640  │  │  │  │  ├─ MemoryCategory_212 (StatsItem)  -  Edit
  16:59:39.640  │  │  │  │  ├─ MemoryCategory_213 (StatsItem)  -  Edit
  16:59:39.640  │  │  │  │  ├─ MemoryCategory_214 (StatsItem)  -  Edit
  16:59:39.640  │  │  │  │  ├─ MemoryCategory_215 (StatsItem)  -  Edit
  16:59:39.640  │  │  │  │  ├─ MemoryCategory_216 (StatsItem)  -  Edit
  16:59:39.640  │  │  │  │  ├─ MemoryCategory_217 (StatsItem)  -  Edit
  16:59:39.640  │  │  │  │  ├─ MemoryCategory_218 (StatsItem)  -  Edit
  16:59:39.640  │  │  │  │  ├─ MemoryCategory_219 (StatsItem)  -  Edit
  16:59:39.640  │  │  │  │  ├─ MemoryCategory_220 (StatsItem)  -  Edit
  16:59:39.640  │  │  │  │  ├─ MemoryCategory_221 (StatsItem)  -  Edit
  16:59:39.640  │  │  │  │  ├─ MemoryCategory_222 (StatsItem)  -  Edit
  16:59:39.640  │  │  │  │  ├─ MemoryCategory_223 (StatsItem)  -  Edit
  16:59:39.640  │  │  │  │  ├─ MemoryCategory_224 (StatsItem)  -  Edit
  16:59:39.640  │  │  │  │  ├─ MemoryCategory_225 (StatsItem)  -  Edit
  16:59:39.640  │  │  │  │  ├─ MemoryCategory_226 (StatsItem)  -  Edit
  16:59:39.640  │  │  │  │  ├─ MemoryCategory_227 (StatsItem)  -  Edit
  16:59:39.640  │  │  │  │  ├─ MemoryCategory_228 (StatsItem)  -  Edit
  16:59:39.640  │  │  │  │  ├─ MemoryCategory_229 (StatsItem)  -  Edit
  16:59:39.640  │  │  │  │  ├─ MemoryCategory_230 (StatsItem)  -  Edit
  16:59:39.640  │  │  │  │  ├─ MemoryCategory_231 (StatsItem)  -  Edit
  16:59:39.641  │  │  │  │  ├─ MemoryCategory_232 (StatsItem)  -  Edit
  16:59:39.641  │  │  │  │  ├─ MemoryCategory_233 (StatsItem)  -  Edit
  16:59:39.641  │  │  │  │  ├─ MemoryCategory_234 (StatsItem)  -  Edit
  16:59:39.641  │  │  │  │  ├─ MemoryCategory_235 (StatsItem)  -  Edit
  16:59:39.641  │  │  │  │  ├─ MemoryCategory_236 (StatsItem)  -  Edit
  16:59:39.641  │  │  │  │  ├─ MemoryCategory_237 (StatsItem)  -  Edit
  16:59:39.641  │  │  │  │  ├─ MemoryCategory_238 (StatsItem)  -  Edit
  16:59:39.641  │  │  │  │  ├─ MemoryCategory_239 (StatsItem)  -  Edit
  16:59:39.641  │  │  │  │  ├─ MemoryCategory_240 (StatsItem)  -  Edit
  16:59:39.641  │  │  │  │  ├─ MemoryCategory_241 (StatsItem)  -  Edit
  16:59:39.641  │  │  │  │  ├─ MemoryCategory_242 (StatsItem)  -  Edit
  16:59:39.641  │  │  │  │  ├─ MemoryCategory_243 (StatsItem)  -  Edit
  16:59:39.641  │  │  │  │  ├─ MemoryCategory_244 (StatsItem)  -  Edit
  16:59:39.641  │  │  │  │  ├─ MemoryCategory_245 (StatsItem)  -  Edit
  16:59:39.641  │  │  │  │  ├─ MemoryCategory_246 (StatsItem)  -  Edit
  16:59:39.641  │  │  │  │  ├─ MemoryCategory_247 (StatsItem)  -  Edit
  16:59:39.641  │  │  │  │  ├─ MemoryCategory_248 (StatsItem)  -  Edit
  16:59:39.641  │  │  │  │  ├─ MemoryCategory_249 (StatsItem)  -  Edit
  16:59:39.641  │  │  │  │  ├─ MemoryCategory_250 (StatsItem)  -  Edit
  16:59:39.641  │  │  │  │  ├─ MemoryCategory_251 (StatsItem)  -  Edit
  16:59:39.641  │  │  │  │  ├─ MemoryCategory_252 (StatsItem)  -  Edit
  16:59:39.641  │  │  │  │  ├─ MemoryCategory_253 (StatsItem)  -  Edit
  16:59:39.641  │  │  │  │  ├─ MemoryCategory_254 (StatsItem)  -  Edit
  16:59:39.641  │  │  │  │  ├─ MemoryCategory_255 (StatsItem)  -  Edit
  16:59:39.641  │  │  │  ├─ CoreScriptMemory (StatsItem)  -  Edit
  16:59:39.641  │  │  │  │  ├─ MemoryCategory_0 (StatsItem)  -  Edit
  16:59:39.641  │  │  │  │  ├─ MemoryCategory_1 (StatsItem)  -  Edit
  16:59:39.642  │  │  │  │  ├─ MemoryCategory_2 (StatsItem)  -  Edit
  16:59:39.642  │  │  │  │  ├─ MemoryCategory_3 (StatsItem)  -  Edit
  16:59:39.642  │  │  │  │  ├─ MemoryCategory_4 (StatsItem)  -  Edit
  16:59:39.642  │  │  │  │  ├─ MemoryCategory_5 (StatsItem)  -  Edit
  16:59:39.642  │  │  │  │  ├─ MemoryCategory_6 (StatsItem)  -  Edit
  16:59:39.642  │  │  │  │  ├─ MemoryCategory_7 (StatsItem)  -  Edit
  16:59:39.642  │  │  │  │  ├─ MemoryCategory_8 (StatsItem)  -  Edit
  16:59:39.642  │  │  │  │  ├─ MemoryCategory_9 (StatsItem)  -  Edit
  16:59:39.642  │  │  │  │  ├─ MemoryCategory_10 (StatsItem)  -  Edit
  16:59:39.642  │  │  │  │  ├─ MemoryCategory_11 (StatsItem)  -  Edit
  16:59:39.642  │  │  │  │  ├─ MemoryCategory_12 (StatsItem)  -  Edit
  16:59:39.642  │  │  │  │  ├─ MemoryCategory_13 (StatsItem)  -  Edit
  16:59:39.642  │  │  │  │  ├─ MemoryCategory_14 (StatsItem)  -  Edit
  16:59:39.642  │  │  │  │  ├─ MemoryCategory_15 (StatsItem)  -  Edit
  16:59:39.642  │  │  │  │  ├─ MemoryCategory_16 (StatsItem)  -  Edit
  16:59:39.642  │  │  │  │  ├─ MemoryCategory_17 (StatsItem)  -  Edit
  16:59:39.642  │  │  │  │  ├─ MemoryCategory_18 (StatsItem)  -  Edit
  16:59:39.642  │  │  │  │  ├─ MemoryCategory_19 (StatsItem)  -  Edit
  16:59:39.642  │  │  │  │  ├─ MemoryCategory_20 (StatsItem)  -  Edit
  16:59:39.642  │  │  │  │  ├─ MemoryCategory_21 (StatsItem)  -  Edit
  16:59:39.642  │  │  │  │  ├─ MemoryCategory_22 (StatsItem)  -  Edit
  16:59:39.642  │  │  │  │  ├─ MemoryCategory_23 (StatsItem)  -  Edit
  16:59:39.642  │  │  │  │  ├─ MemoryCategory_24 (StatsItem)  -  Edit
  16:59:39.642  │  │  │  │  ├─ MemoryCategory_25 (StatsItem)  -  Edit
  16:59:39.642  │  │  │  │  ├─ MemoryCategory_26 (StatsItem)  -  Edit
  16:59:39.642  │  │  │  │  ├─ MemoryCategory_27 (StatsItem)  -  Edit
  16:59:39.642  │  │  │  │  ├─ MemoryCategory_28 (StatsItem)  -  Edit
  16:59:39.643  │  │  │  │  ├─ MemoryCategory_29 (StatsItem)  -  Edit
  16:59:39.643  │  │  │  │  ├─ MemoryCategory_30 (StatsItem)  -  Edit
  16:59:39.643  │  │  │  │  ├─ MemoryCategory_31 (StatsItem)  -  Edit
  16:59:39.643  │  │  │  │  ├─ MemoryCategory_32 (StatsItem)  -  Edit
  16:59:39.643  │  │  │  │  ├─ MemoryCategory_33 (StatsItem)  -  Edit
  16:59:39.643  │  │  │  │  ├─ MemoryCategory_34 (StatsItem)  -  Edit
  16:59:39.643  │  │  │  │  ├─ MemoryCategory_35 (StatsItem)  -  Edit
  16:59:39.643  │  │  │  │  ├─ MemoryCategory_36 (StatsItem)  -  Edit
  16:59:39.643  │  │  │  │  ├─ MemoryCategory_37 (StatsItem)  -  Edit
  16:59:39.643  │  │  │  │  ├─ MemoryCategory_38 (StatsItem)  -  Edit
  16:59:39.643  │  │  │  │  ├─ MemoryCategory_39 (StatsItem)  -  Edit
  16:59:39.643  │  │  │  │  ├─ MemoryCategory_40 (StatsItem)  -  Edit
  16:59:39.643  │  │  │  │  ├─ MemoryCategory_41 (StatsItem)  -  Edit
  16:59:39.643  │  │  │  │  ├─ MemoryCategory_42 (StatsItem)  -  Edit
  16:59:39.643  │  │  │  │  ├─ MemoryCategory_43 (StatsItem)  -  Edit
  16:59:39.643  │  │  │  │  ├─ MemoryCategory_44 (StatsItem)  -  Edit
  16:59:39.643  │  │  │  │  ├─ MemoryCategory_45 (StatsItem)  -  Edit
  16:59:39.643  │  │  │  │  ├─ MemoryCategory_46 (StatsItem)  -  Edit
  16:59:39.643  │  │  │  │  ├─ MemoryCategory_47 (StatsItem)  -  Edit
  16:59:39.643  │  │  │  │  ├─ MemoryCategory_48 (StatsItem)  -  Edit
  16:59:39.643  │  │  │  │  ├─ MemoryCategory_49 (StatsItem)  -  Edit
  16:59:39.643  │  │  │  │  ├─ MemoryCategory_50 (StatsItem)  -  Edit
  16:59:39.643  │  │  │  │  ├─ MemoryCategory_51 (StatsItem)  -  Edit
  16:59:39.643  │  │  │  │  ├─ MemoryCategory_52 (StatsItem)  -  Edit
  16:59:39.643  │  │  │  │  ├─ MemoryCategory_53 (StatsItem)  -  Edit
  16:59:39.644  │  │  │  │  ├─ MemoryCategory_54 (StatsItem)  -  Edit
  16:59:39.644  │  │  │  │  ├─ MemoryCategory_55 (StatsItem)  -  Edit
  16:59:39.644  │  │  │  │  ├─ MemoryCategory_56 (StatsItem)  -  Edit
  16:59:39.644  │  │  │  │  ├─ MemoryCategory_57 (StatsItem)  -  Edit
  16:59:39.644  │  │  │  │  ├─ MemoryCategory_58 (StatsItem)  -  Edit
  16:59:39.644  │  │  │  │  ├─ MemoryCategory_59 (StatsItem)  -  Edit
  16:59:39.644  │  │  │  │  ├─ MemoryCategory_60 (StatsItem)  -  Edit
  16:59:39.644  │  │  │  │  ├─ MemoryCategory_61 (StatsItem)  -  Edit
  16:59:39.644  │  │  │  │  ├─ MemoryCategory_62 (StatsItem)  -  Edit
  16:59:39.644  │  │  │  │  ├─ MemoryCategory_63 (StatsItem)  -  Edit
  16:59:39.644  │  │  │  │  ├─ MemoryCategory_64 (StatsItem)  -  Edit
  16:59:39.644  │  │  │  │  ├─ MemoryCategory_65 (StatsItem)  -  Edit
  16:59:39.644  │  │  │  │  ├─ MemoryCategory_66 (StatsItem)  -  Edit
  16:59:39.644  │  │  │  │  ├─ MemoryCategory_67 (StatsItem)  -  Edit
  16:59:39.644  │  │  │  │  ├─ MemoryCategory_68 (StatsItem)  -  Edit
  16:59:39.644  │  │  │  │  ├─ MemoryCategory_69 (StatsItem)  -  Edit
  16:59:39.644  │  │  │  │  ├─ MemoryCategory_70 (StatsItem)  -  Edit
  16:59:39.644  │  │  │  │  ├─ MemoryCategory_71 (StatsItem)  -  Edit
  16:59:39.644  │  │  │  │  ├─ MemoryCategory_72 (StatsItem)  -  Edit
  16:59:39.644  │  │  │  │  ├─ MemoryCategory_73 (StatsItem)  -  Edit
  16:59:39.644  │  │  │  │  ├─ MemoryCategory_74 (StatsItem)  -  Edit
  16:59:39.644  │  │  │  │  ├─ MemoryCategory_75 (StatsItem)  -  Edit
  16:59:39.644  │  │  │  │  ├─ MemoryCategory_76 (StatsItem)  -  Edit
  16:59:39.644  │  │  │  │  ├─ MemoryCategory_77 (StatsItem)  -  Edit
  16:59:39.644  │  │  │  │  ├─ MemoryCategory_78 (StatsItem)  -  Edit
  16:59:39.644  │  │  │  │  ├─ MemoryCategory_79 (StatsItem)  -  Edit
  16:59:39.644  │  │  │  │  ├─ MemoryCategory_80 (StatsItem)  -  Edit
  16:59:39.644  │  │  │  │  ├─ MemoryCategory_81 (StatsItem)  -  Edit
  16:59:39.645  │  │  │  │  ├─ MemoryCategory_82 (StatsItem)  -  Edit
  16:59:39.645  │  │  │  │  ├─ MemoryCategory_83 (StatsItem)  -  Edit
  16:59:39.645  │  │  │  │  ├─ MemoryCategory_84 (StatsItem)  -  Edit
  16:59:39.645  │  │  │  │  ├─ MemoryCategory_85 (StatsItem)  -  Edit
  16:59:39.645  │  │  │  │  ├─ MemoryCategory_86 (StatsItem)  -  Edit
  16:59:39.645  │  │  │  │  ├─ MemoryCategory_87 (StatsItem)  -  Edit
  16:59:39.645  │  │  │  │  ├─ MemoryCategory_88 (StatsItem)  -  Edit
  16:59:39.645  │  │  │  │  ├─ MemoryCategory_89 (StatsItem)  -  Edit
  16:59:39.645  │  │  │  │  ├─ MemoryCategory_90 (StatsItem)  -  Edit
  16:59:39.645  │  │  │  │  ├─ MemoryCategory_91 (StatsItem)  -  Edit
  16:59:39.645  │  │  │  │  ├─ MemoryCategory_92 (StatsItem)  -  Edit
  16:59:39.645  │  │  │  │  ├─ MemoryCategory_93 (StatsItem)  -  Edit
  16:59:39.645  │  │  │  │  ├─ MemoryCategory_94 (StatsItem)  -  Edit
  16:59:39.645  │  │  │  │  ├─ MemoryCategory_95 (StatsItem)  -  Edit
  16:59:39.645  │  │  │  │  ├─ MemoryCategory_96 (StatsItem)  -  Edit
  16:59:39.645  │  │  │  │  ├─ MemoryCategory_97 (StatsItem)  -  Edit
  16:59:39.645  │  │  │  │  ├─ MemoryCategory_98 (StatsItem)  -  Edit
  16:59:39.645  │  │  │  │  ├─ MemoryCategory_99 (StatsItem)  -  Edit
  16:59:39.645  │  │  │  │  ├─ MemoryCategory_100 (StatsItem)  -  Edit
  16:59:39.645  │  │  │  │  ├─ MemoryCategory_101 (StatsItem)  -  Edit
  16:59:39.645  │  │  │  │  ├─ MemoryCategory_102 (StatsItem)  -  Edit
  16:59:39.645  │  │  │  │  ├─ MemoryCategory_103 (StatsItem)  -  Edit
  16:59:39.645  │  │  │  │  ├─ MemoryCategory_104 (StatsItem)  -  Edit
  16:59:39.645  │  │  │  │  ├─ MemoryCategory_105 (StatsItem)  -  Edit
  16:59:39.645  │  │  │  │  ├─ MemoryCategory_106 (StatsItem)  -  Edit
  16:59:39.645  │  │  │  │  ├─ MemoryCategory_107 (StatsItem)  -  Edit
  16:59:39.645  │  │  │  │  ├─ MemoryCategory_108 (StatsItem)  -  Edit
  16:59:39.645  │  │  │  │  ├─ MemoryCategory_109 (StatsItem)  -  Edit
  16:59:39.646  │  │  │  │  ├─ MemoryCategory_110 (StatsItem)  -  Edit
  16:59:39.646  │  │  │  │  ├─ MemoryCategory_111 (StatsItem)  -  Edit
  16:59:39.646  │  │  │  │  ├─ MemoryCategory_112 (StatsItem)  -  Edit
  16:59:39.646  │  │  │  │  ├─ MemoryCategory_113 (StatsItem)  -  Edit
  16:59:39.646  │  │  │  │  ├─ MemoryCategory_114 (StatsItem)  -  Edit
  16:59:39.646  │  │  │  │  ├─ MemoryCategory_115 (StatsItem)  -  Edit
  16:59:39.646  │  │  │  │  ├─ MemoryCategory_116 (StatsItem)  -  Edit
  16:59:39.646  │  │  │  │  ├─ MemoryCategory_117 (StatsItem)  -  Edit
  16:59:39.646  │  │  │  │  ├─ MemoryCategory_118 (StatsItem)  -  Edit
  16:59:39.646  │  │  │  │  ├─ MemoryCategory_119 (StatsItem)  -  Edit
  16:59:39.646  │  │  │  │  ├─ MemoryCategory_120 (StatsItem)  -  Edit
  16:59:39.646  │  │  │  │  ├─ MemoryCategory_121 (StatsItem)  -  Edit
  16:59:39.646  │  │  │  │  ├─ MemoryCategory_122 (StatsItem)  -  Edit
  16:59:39.646  │  │  │  │  ├─ MemoryCategory_123 (StatsItem)  -  Edit
  16:59:39.646  │  │  │  │  ├─ MemoryCategory_124 (StatsItem)  -  Edit
  16:59:39.646  │  │  │  │  ├─ MemoryCategory_125 (StatsItem)  -  Edit
  16:59:39.646  │  │  │  │  ├─ MemoryCategory_126 (StatsItem)  -  Edit
  16:59:39.646  │  │  │  │  ├─ MemoryCategory_127 (StatsItem)  -  Edit
  16:59:39.646  │  │  │  │  ├─ MemoryCategory_128 (StatsItem)  -  Edit
  16:59:39.646  │  │  │  │  ├─ MemoryCategory_129 (StatsItem)  -  Edit
  16:59:39.646  │  │  │  │  ├─ MemoryCategory_130 (StatsItem)  -  Edit
  16:59:39.646  │  │  │  │  ├─ MemoryCategory_131 (StatsItem)  -  Edit
  16:59:39.646  │  │  │  │  ├─ MemoryCategory_132 (StatsItem)  -  Edit
  16:59:39.646  │  │  │  │  ├─ MemoryCategory_133 (StatsItem)  -  Edit
  16:59:39.646  │  │  │  │  ├─ MemoryCategory_134 (StatsItem)  -  Edit
  16:59:39.646  │  │  │  │  ├─ MemoryCategory_135 (StatsItem)  -  Edit
  16:59:39.646  │  │  │  │  ├─ MemoryCategory_136 (StatsItem)  -  Edit
  16:59:39.646  │  │  │  │  ├─ MemoryCategory_137 (StatsItem)  -  Edit
  16:59:39.647  │  │  │  │  ├─ MemoryCategory_138 (StatsItem)  -  Edit
  16:59:39.647  │  │  │  │  ├─ MemoryCategory_139 (StatsItem)  -  Edit
  16:59:39.647  │  │  │  │  ├─ MemoryCategory_140 (StatsItem)  -  Edit
  16:59:39.647  │  │  │  │  ├─ MemoryCategory_141 (StatsItem)  -  Edit
  16:59:39.647  │  │  │  │  ├─ MemoryCategory_142 (StatsItem)  -  Edit
  16:59:39.647  │  │  │  │  ├─ MemoryCategory_143 (StatsItem)  -  Edit
  16:59:39.647  │  │  │  │  ├─ MemoryCategory_144 (StatsItem)  -  Edit
  16:59:39.647  │  │  │  │  ├─ MemoryCategory_145 (StatsItem)  -  Edit
  16:59:39.647  │  │  │  │  ├─ MemoryCategory_146 (StatsItem)  -  Edit
  16:59:39.647  │  │  │  │  ├─ MemoryCategory_147 (StatsItem)  -  Edit
  16:59:39.647  │  │  │  │  ├─ MemoryCategory_148 (StatsItem)  -  Edit
  16:59:39.647  │  │  │  │  ├─ MemoryCategory_149 (StatsItem)  -  Edit
  16:59:39.647  │  │  │  │  ├─ MemoryCategory_150 (StatsItem)  -  Edit
  16:59:39.647  │  │  │  │  ├─ MemoryCategory_151 (StatsItem)  -  Edit
  16:59:39.647  │  │  │  │  ├─ MemoryCategory_152 (StatsItem)  -  Edit
  16:59:39.647  │  │  │  │  ├─ MemoryCategory_153 (StatsItem)  -  Edit
  16:59:39.647  │  │  │  │  ├─ MemoryCategory_154 (StatsItem)  -  Edit
  16:59:39.647  │  │  │  │  ├─ MemoryCategory_155 (StatsItem)  -  Edit
  16:59:39.647  │  │  │  │  ├─ MemoryCategory_156 (StatsItem)  -  Edit
  16:59:39.647  │  │  │  │  ├─ MemoryCategory_157 (StatsItem)  -  Edit
  16:59:39.647  │  │  │  │  ├─ MemoryCategory_158 (StatsItem)  -  Edit
  16:59:39.647  │  │  │  │  ├─ MemoryCategory_159 (StatsItem)  -  Edit
  16:59:39.647  │  │  │  │  ├─ MemoryCategory_160 (StatsItem)  -  Edit
  16:59:39.647  │  │  │  │  ├─ MemoryCategory_161 (StatsItem)  -  Edit
  16:59:39.647  │  │  │  │  ├─ MemoryCategory_162 (StatsItem)  -  Edit
  16:59:39.647  │  │  │  │  ├─ MemoryCategory_163 (StatsItem)  -  Edit
  16:59:39.647  │  │  │  │  ├─ MemoryCategory_164 (StatsItem)  -  Edit
  16:59:39.648  │  │  │  │  ├─ MemoryCategory_165 (StatsItem)  -  Edit
  16:59:39.648  │  │  │  │  ├─ MemoryCategory_166 (StatsItem)  -  Edit
  16:59:39.648  │  │  │  │  ├─ MemoryCategory_167 (StatsItem)  -  Edit
  16:59:39.648  │  │  │  │  ├─ MemoryCategory_168 (StatsItem)  -  Edit
  16:59:39.648  │  │  │  │  ├─ MemoryCategory_169 (StatsItem)  -  Edit
  16:59:39.648  │  │  │  │  ├─ MemoryCategory_170 (StatsItem)  -  Edit
  16:59:39.648  │  │  │  │  ├─ MemoryCategory_171 (StatsItem)  -  Edit
  16:59:39.648  │  │  │  │  ├─ MemoryCategory_172 (StatsItem)  -  Edit
  16:59:39.648  │  │  │  │  ├─ MemoryCategory_173 (StatsItem)  -  Edit
  16:59:39.648  │  │  │  │  ├─ MemoryCategory_174 (StatsItem)  -  Edit
  16:59:39.648  │  │  │  │  ├─ MemoryCategory_175 (StatsItem)  -  Edit
  16:59:39.648  │  │  │  │  ├─ MemoryCategory_176 (StatsItem)  -  Edit
  16:59:39.648  │  │  │  │  ├─ MemoryCategory_177 (StatsItem)  -  Edit
  16:59:39.648  │  │  │  │  ├─ MemoryCategory_178 (StatsItem)  -  Edit
  16:59:39.648  │  │  │  │  ├─ MemoryCategory_179 (StatsItem)  -  Edit
  16:59:39.648  │  │  │  │  ├─ MemoryCategory_180 (StatsItem)  -  Edit
  16:59:39.648  │  │  │  │  ├─ MemoryCategory_181 (StatsItem)  -  Edit
  16:59:39.648  │  │  │  │  ├─ MemoryCategory_182 (StatsItem)  -  Edit
  16:59:39.648  │  │  │  │  ├─ MemoryCategory_183 (StatsItem)  -  Edit
  16:59:39.648  │  │  │  │  ├─ MemoryCategory_184 (StatsItem)  -  Edit
  16:59:39.648  │  │  │  │  ├─ MemoryCategory_185 (StatsItem)  -  Edit
  16:59:39.648  │  │  │  │  ├─ MemoryCategory_186 (StatsItem)  -  Edit
  16:59:39.648  │  │  │  │  ├─ MemoryCategory_187 (StatsItem)  -  Edit
  16:59:39.648  │  │  │  │  ├─ MemoryCategory_188 (StatsItem)  -  Edit
  16:59:39.648  │  │  │  │  ├─ MemoryCategory_189 (StatsItem)  -  Edit
  16:59:39.648  │  │  │  │  ├─ MemoryCategory_190 (StatsItem)  -  Edit
  16:59:39.648  │  │  │  │  ├─ MemoryCategory_191 (StatsItem)  -  Edit
  16:59:39.648  │  │  │  │  ├─ MemoryCategory_192 (StatsItem)  -  Edit
  16:59:39.649  │  │  │  │  ├─ MemoryCategory_193 (StatsItem)  -  Edit
  16:59:39.649  │  │  │  │  ├─ MemoryCategory_194 (StatsItem)  -  Edit
  16:59:39.649  │  │  │  │  ├─ MemoryCategory_195 (StatsItem)  -  Edit
  16:59:39.649  │  │  │  │  ├─ MemoryCategory_196 (StatsItem)  -  Edit
  16:59:39.649  │  │  │  │  ├─ MemoryCategory_197 (StatsItem)  -  Edit
  16:59:39.649  │  │  │  │  ├─ MemoryCategory_198 (StatsItem)  -  Edit
  16:59:39.649  │  │  │  │  ├─ MemoryCategory_199 (StatsItem)  -  Edit
  16:59:39.649  │  │  │  │  ├─ MemoryCategory_200 (StatsItem)  -  Edit
  16:59:39.649  │  │  │  │  ├─ MemoryCategory_201 (StatsItem)  -  Edit
  16:59:39.649  │  │  │  │  ├─ MemoryCategory_202 (StatsItem)  -  Edit
  16:59:39.649  │  │  │  │  ├─ MemoryCategory_203 (StatsItem)  -  Edit
  16:59:39.649  │  │  │  │  ├─ MemoryCategory_204 (StatsItem)  -  Edit
  16:59:39.649  │  │  │  │  ├─ MemoryCategory_205 (StatsItem)  -  Edit
  16:59:39.649  │  │  │  │  ├─ MemoryCategory_206 (StatsItem)  -  Edit
  16:59:39.649  │  │  │  │  ├─ MemoryCategory_207 (StatsItem)  -  Edit
  16:59:39.649  │  │  │  │  ├─ MemoryCategory_208 (StatsItem)  -  Edit
  16:59:39.649  │  │  │  │  ├─ MemoryCategory_209 (StatsItem)  -  Edit
  16:59:39.649  │  │  │  │  ├─ MemoryCategory_210 (StatsItem)  -  Edit
  16:59:39.649  │  │  │  │  ├─ MemoryCategory_211 (StatsItem)  -  Edit
  16:59:39.649  │  │  │  │  ├─ MemoryCategory_212 (StatsItem)  -  Edit
  16:59:39.649  │  │  │  │  ├─ MemoryCategory_213 (StatsItem)  -  Edit
  16:59:39.649  │  │  │  │  ├─ MemoryCategory_214 (StatsItem)  -  Edit
  16:59:39.649  │  │  │  │  ├─ MemoryCategory_215 (StatsItem)  -  Edit
  16:59:39.649  │  │  │  │  ├─ MemoryCategory_216 (StatsItem)  -  Edit
  16:59:39.649  │  │  │  │  ├─ MemoryCategory_217 (StatsItem)  -  Edit
  16:59:39.649  │  │  │  │  ├─ MemoryCategory_218 (StatsItem)  -  Edit
  16:59:39.649  │  │  │  │  ├─ MemoryCategory_219 (StatsItem)  -  Edit
  16:59:39.649  │  │  │  │  ├─ MemoryCategory_220 (StatsItem)  -  Edit
  16:59:39.649  │  │  │  │  ├─ MemoryCategory_221 (StatsItem)  -  Edit
  16:59:39.649  │  │  │  │  ├─ MemoryCategory_222 (StatsItem)  -  Edit
  16:59:39.649  │  │  │  │  ├─ MemoryCategory_223 (StatsItem)  -  Edit
  16:59:39.649  │  │  │  │  ├─ MemoryCategory_224 (StatsItem)  -  Edit
  16:59:39.650  │  │  │  │  ├─ MemoryCategory_225 (StatsItem)  -  Edit
  16:59:39.650  │  │  │  │  ├─ MemoryCategory_226 (StatsItem)  -  Edit
  16:59:39.650  │  │  │  │  ├─ MemoryCategory_227 (StatsItem)  -  Edit
  16:59:39.650  │  │  │  │  ├─ MemoryCategory_228 (StatsItem)  -  Edit
  16:59:39.650  │  │  │  │  ├─ MemoryCategory_229 (StatsItem)  -  Edit
  16:59:39.650  │  │  │  │  ├─ MemoryCategory_230 (StatsItem)  -  Edit
  16:59:39.650  │  │  │  │  ├─ MemoryCategory_231 (StatsItem)  -  Edit
  16:59:39.650  │  │  │  │  ├─ MemoryCategory_232 (StatsItem)  -  Edit
  16:59:39.650  │  │  │  │  ├─ MemoryCategory_233 (StatsItem)  -  Edit
  16:59:39.650  │  │  │  │  ├─ MemoryCategory_234 (StatsItem)  -  Edit
  16:59:39.650  │  │  │  │  ├─ MemoryCategory_235 (StatsItem)  -  Edit
  16:59:39.650  │  │  │  │  ├─ MemoryCategory_236 (StatsItem)  -  Edit
  16:59:39.650  │  │  │  │  ├─ MemoryCategory_237 (StatsItem)  -  Edit
  16:59:39.650  │  │  │  │  ├─ MemoryCategory_238 (StatsItem)  -  Edit
  16:59:39.650  │  │  │  │  ├─ MemoryCategory_239 (StatsItem)  -  Edit
  16:59:39.650  │  │  │  │  ├─ MemoryCategory_240 (StatsItem)  -  Edit
  16:59:39.650  │  │  │  │  ├─ MemoryCategory_241 (StatsItem)  -  Edit
  16:59:39.650  │  │  │  │  ├─ MemoryCategory_242 (StatsItem)  -  Edit
  16:59:39.650  │  │  │  │  ├─ MemoryCategory_243 (StatsItem)  -  Edit
  16:59:39.650  │  │  │  │  ├─ MemoryCategory_244 (StatsItem)  -  Edit
  16:59:39.650  │  │  │  │  ├─ MemoryCategory_245 (StatsItem)  -  Edit
  16:59:39.650  │  │  │  │  ├─ MemoryCategory_246 (StatsItem)  -  Edit
  16:59:39.650  │  │  │  │  ├─ MemoryCategory_247 (StatsItem)  -  Edit
  16:59:39.650  │  │  │  │  ├─ MemoryCategory_248 (StatsItem)  -  Edit
  16:59:39.650  │  │  │  │  ├─ MemoryCategory_249 (StatsItem)  -  Edit
  16:59:39.650  │  │  │  │  ├─ MemoryCategory_250 (StatsItem)  -  Edit
  16:59:39.650  │  │  │  │  ├─ MemoryCategory_251 (StatsItem)  -  Edit
  16:59:39.650  │  │  │  │  ├─ MemoryCategory_252 (StatsItem)  -  Edit
  16:59:39.650  │  │  │  │  ├─ MemoryCategory_253 (StatsItem)  -  Edit
  16:59:39.651  │  │  │  │  ├─ MemoryCategory_254 (StatsItem)  -  Edit
  16:59:39.651  │  │  │  │  ├─ MemoryCategory_255 (StatsItem)  -  Edit
  16:59:39.651  │  │  ├─ MaxMemory (StatsItem)  -  Edit
  16:59:39.651  │  │  ├─ CPU (StatsItem)  -  Edit
  16:59:39.651  │  │  ├─ MaxCPU (StatsItem)  -  Edit
  16:59:39.651  │  │  ├─ GPU (StatsItem)  -  Edit
  16:59:39.651  │  │  ├─ MaxGPU (StatsItem)  -  Edit
  16:59:39.651  │  │  ├─ Ping (StatsItem)  -  Edit
  16:59:39.651  │  │  ├─ MaxPing (StatsItem)  -  Edit
  16:59:39.651  │  │  ├─ NetworkReceived (StatsItem)  -  Edit
  16:59:39.651  │  │  ├─ MaxNetworkReceived (StatsItem)  -  Edit
  16:59:39.651  │  │  ├─ NetworkSent (StatsItem)  -  Edit
  16:59:39.651  │  │  ├─ MaxNetworkSent (StatsItem)  -  Edit
  16:59:39.651  │  ├─ Workspace (StatsItem)  -  Edit
  16:59:39.651  │  │  ├─ FPS (StatsItem)  -  Edit
  16:59:39.651  │  │  ├─ Heartbeat (StatsItem)  -  Edit
  16:59:39.651  │  │  ├─ Environment Speed % (StatsItem)  -  Edit
  16:59:39.651  │  │  ├─ World (StatsItem)  -  Edit
  16:59:39.651  │  │  │  ├─ Primitives (StatsItem)  -  Edit
  16:59:39.651  │  │  │  ├─ Joints (StatsItem)  -  Edit
  16:59:39.651  │  │  │  ├─ Contacts (StatsItem)  -  Edit
  16:59:39.651  │  │  │  ├─ Non-Anchored Assemblies (StatsItem)  -  Edit
  16:59:39.651  │  │  │  ├─ Sleeping Assemblies (StatsItem)  -  Edit
  16:59:39.651  │  │  │  ├─ Sleep Checking Assemblies (StatsItem)  -  Edit
  16:59:39.651  │  │  │  ├─ Awake Assemblies (StatsItem)  -  Edit
  16:59:39.651  │  │  ├─ Contacts (StatsItem)  -  Edit
  16:59:39.651  │  │  │  ├─ CtctStageCtcts (StatsItem)  -  Edit
  16:59:39.652  │  │  │  ├─ SteppingCtcts (StatsItem)  -  Edit
  16:59:39.652  │  │  │  ├─ TouchingCtcts (StatsItem)  -  Edit
  16:59:39.652  │  │  │  ├─ MaxTreeDepth (StatsItem)  -  Edit
  16:59:39.652  │  │  ├─ Kernel (StatsItem)  -  Edit
  16:59:39.652  │  │  │  ├─ Bodies (StatsItem)  -  Edit
  16:59:39.652  │  │  │  ├─ Constraints (StatsItem)  -  Edit
  16:59:39.652  │  │  ├─ File Operations (StatsItem)  -  Edit
  16:59:39.652  │  │  │  ├─ Total Load Time (StatsItem)  -  Edit
  16:59:39.652  │  │  │  ├─ SyncHttpGet Time (StatsItem)  -  Edit
  16:59:39.652  │  │  │  ├─ XML Load Time (StatsItem)  -  Edit
  16:59:39.652  │  │  │  ├─ Join All Time (StatsItem)  -  Edit
  16:59:39.652  │  ├─ Sound (StatsItem)  -  Edit
  16:59:39.652  │  │  ├─ CPU (StatsItem)  -  Edit
  16:59:39.652  │  │  │  ├─ Dsp (StatsItem)  -  Edit
  16:59:39.652  │  │  │  ├─ Stream (StatsItem)  -  Edit
  16:59:39.652  │  │  │  ├─ Geometry (StatsItem)  -  Edit
  16:59:39.652  │  │  │  ├─ Update (StatsItem)  -  Edit
  16:59:39.652  │  │  ├─ ChannelsPlaying (StatsItem)  -  Edit
  16:59:39.652  │  │  ├─ Current (StatsItem)  -  Edit
  16:59:39.652  │  │  ├─ Max (StatsItem)  -  Edit
  16:59:39.652  │  │  ├─ # Sounds (StatsItem)  -  Edit
  16:59:39.652  │  │  ├─ # Unused (StatsItem)  -  Edit
  16:59:39.652  │  ├─ ChangeHistory (StatsItem)  -  Edit
  16:59:39.652  │  │  ├─ Data Size (StatsItem)  -  Edit
  16:59:39.652  │  │  ├─ Constrained Data Size (StatsItem)  -  Edit
  16:59:39.652  │  │  ├─ Stack Size (StatsItem)  -  Edit
  16:59:39.652  │  ├─ Network (StatsItem)  -  Edit
  16:59:39.652  │  │  ├─ Packets Thread (StatsItem)  -  Edit
  16:59:39.652  │  │  │  ├─ Rate (StatsItem)  -  Edit
  16:59:39.653  │  │  │  ├─ Activity (StatsItem)  -  Edit
  16:59:39.653  │  │  │  ├─ Physics Senders (StatsItem)  -  Edit
  16:59:39.653  │  │  │  ├─ Send Buffer Health (StatsItem)  -  Edit
  16:59:39.653  │  │  ├─ ServerStatsItem (StatsItem)  -  Edit
  16:59:39.653  │  │  │  ├─ Ping (StatsItem)  -  Edit
  16:59:39.653  │  │  │  ├─ Data Ping (RunningAverageItemInt)  -  Edit
  16:59:39.653  │  │  │  ├─ StreamingEnabled (StatsItem)  -  Edit
  16:59:39.653  │  │  │  ├─ Stats (StatsItem)  -  Edit
  16:59:39.653  │  │  │  │  ├─ messageDataBytesSentPerSec (StatsItem)  -  Edit
  16:59:39.653  │  │  │  │  ├─ messageTotalBytesSentPerSec (StatsItem)  -  Edit
  16:59:39.653  │  │  │  │  ├─ messageDataBytesResentPerSec (StatsItem)  -  Edit
  16:59:39.653  │  │  │  │  ├─ messagesBytesReceivedPerSec (StatsItem)  -  Edit
  16:59:39.653  │  │  │  │  ├─ messagesBytesReceivedAndIgnoredPerSec (StatsItem)  -  Edit
  16:59:39.653  │  │  │  │  ├─ bytesSentPerSec (StatsItem)  -  Edit
  16:59:39.653  │  │  │  │  ├─ bytesReceivedPerSec (StatsItem)  -  Edit
  16:59:39.653  │  │  │  │  ├─ totalMessageBytesPushed (StatsItem)  -  Edit
  16:59:39.653  │  │  │  │  ├─ totalMessageBytesSent (StatsItem)  -  Edit
  16:59:39.653  │  │  │  │  ├─ totalMessageBytesResent (StatsItem)  -  Edit
  16:59:39.653  │  │  │  │  ├─ totalMessagesBytesReceived (StatsItem)  -  Edit
  16:59:39.653  │  │  │  │  ├─ totalMessagesBytesReceivedAndIgnored (StatsItem)  -  Edit
  16:59:39.653  │  │  │  │  ├─ totalBytesSent (StatsItem)  -  Edit
  16:59:39.653  │  │  │  │  ├─ totalBytesReceived (StatsItem)  -  Edit
  16:59:39.653  │  │  │  │  ├─ connectionStartTime (StatsItem)  -  Edit
  16:59:39.653  │  │  │  │  ├─ outgoingBandwidthLimitBytesPerSecond (StatsItem)  -  Edit
  16:59:39.653  │  │  │  │  ├─ isLimitedByOutgoingBandwidthLimit (StatsItem)  -  Edit
  16:59:39.653  │  │  │  │  ├─ congestionControlLimitBytesPerSecond (StatsItem)  -  Edit
  16:59:39.653  │  │  │  │  ├─ isLimitedByCongestionControl (StatsItem)  -  Edit
  16:59:39.653  │  │  │  │  ├─ messageSendBuffer (StatsItem)  -  Edit
  16:59:39.654  │  │  │  │  │  ├─ IMMEDIATE_PRIORITY (StatsItem)  -  Edit
  16:59:39.654  │  │  │  │  │  ├─ HIGH_PRIORITY (StatsItem)  -  Edit
  16:59:39.654  │  │  │  │  │  ├─ MEDIUM_PRIORITY (StatsItem)  -  Edit
  16:59:39.654  │  │  │  │  │  ├─ LOW_PRIORITY (StatsItem)  -  Edit
  16:59:39.654  │  │  │  │  ├─ bytesInSendBuffer (StatsItem)  -  Edit
  16:59:39.654  │  │  │  │  │  ├─ IMMEDIATE_PRIORITY (StatsItem)  -  Edit
  16:59:39.654  │  │  │  │  │  ├─ HIGH_PRIORITY (StatsItem)  -  Edit
  16:59:39.654  │  │  │  │  │  ├─ MEDIUM_PRIORITY (StatsItem)  -  Edit
  16:59:39.654  │  │  │  │  │  ├─ LOW_PRIORITY (StatsItem)  -  Edit
  16:59:39.654  │  │  │  │  ├─ messagesInResendQueue (StatsItem)  -  Edit
  16:59:39.654  │  │  │  │  ├─ bytesInResendQueue (StatsItem)  -  Edit
  16:59:39.654  │  │  │  │  ├─ packetlossLastSecond (StatsItem)  -  Edit
  16:59:39.654  │  │  │  │  ├─ packetlossTotal (StatsItem)  -  Edit
  16:59:39.654  │  │  │  │  ├─ numberOfUnsplitMessages (StatsItem)  -  Edit
  16:59:39.654  │  │  │  │  ├─ numberOfSplitMessages (StatsItem)  -  Edit
  16:59:39.654  │  │  │  │  ├─ messageDataBytesSentPerSec (StatsItem)  -  Edit
  16:59:39.654  │  │  │  │  ├─ messageTotalBytesSentPerSec (StatsItem)  -  Edit
  16:59:39.654  │  │  │  │  ├─ messageDataBytesResentPerSec (StatsItem)  -  Edit
  16:59:39.654  │  │  │  │  ├─ messagesBytesReceivedPerSec (StatsItem)  -  Edit
  16:59:39.654  │  │  │  │  ├─ messagesBytesReceivedAndIgnoredPerSec (StatsItem)  -  Edit
  16:59:39.654  │  │  │  │  ├─ bytesSentPerSec (StatsItem)  -  Edit
  16:59:39.654  │  │  │  │  ├─ bytesReceivedPerSec (StatsItem)  -  Edit
  16:59:39.654  │  │  │  │  ├─ totalMessageBytesPushed (StatsItem)  -  Edit
  16:59:39.654  │  │  │  │  ├─ totalMessageBytesSent (StatsItem)  -  Edit
  16:59:39.654  │  │  │  │  ├─ totalMessageBytesResent (StatsItem)  -  Edit
  16:59:39.654  │  │  │  │  ├─ totalMessagesBytesReceived (StatsItem)  -  Edit
  16:59:39.655  │  │  │  │  ├─ totalMessagesBytesReceivedAndIgnored (StatsItem)  -  Edit
  16:59:39.655  │  │  │  │  ├─ totalBytesSent (StatsItem)  -  Edit
  16:59:39.655  │  │  │  │  ├─ totalBytesReceived (StatsItem)  -  Edit
  16:59:39.655  │  │  │  │  ├─ connectionStartTime (StatsItem)  -  Edit
  16:59:39.655  │  │  │  │  ├─ outgoingBandwidthLimitBytesPerSecond (StatsItem)  -  Edit
  16:59:39.655  │  │  │  │  ├─ isLimitedByOutgoingBandwidthLimit (StatsItem)  -  Edit
  16:59:39.655  │  │  │  │  ├─ congestionControlLimitBytesPerSecond (StatsItem)  -  Edit
  16:59:39.655  │  │  │  │  ├─ isLimitedByCongestionControl (StatsItem)  -  Edit
  16:59:39.655  │  │  │  │  ├─ messageSendBuffer (StatsItem)  -  Edit
  16:59:39.655  │  │  │  │  │  ├─ IMMEDIATE_PRIORITY (StatsItem)  -  Edit
  16:59:39.655  │  │  │  │  │  ├─ HIGH_PRIORITY (StatsItem)  -  Edit
  16:59:39.655  │  │  │  │  │  ├─ MEDIUM_PRIORITY (StatsItem)  -  Edit
  16:59:39.655  │  │  │  │  │  ├─ LOW_PRIORITY (StatsItem)  -  Edit
  16:59:39.655  │  │  │  │  ├─ bytesInSendBuffer (StatsItem)  -  Edit
  16:59:39.655  │  │  │  │  │  ├─ IMMEDIATE_PRIORITY (StatsItem)  -  Edit
  16:59:39.655  │  │  │  │  │  ├─ HIGH_PRIORITY (StatsItem)  -  Edit
  16:59:39.655  │  │  │  │  │  ├─ MEDIUM_PRIORITY (StatsItem)  -  Edit
  16:59:39.655  │  │  │  │  │  ├─ LOW_PRIORITY (StatsItem)  -  Edit
  16:59:39.655  │  │  │  │  ├─ messagesInResendQueue (StatsItem)  -  Edit
  16:59:39.655  │  │  │  │  ├─ bytesInResendQueue (StatsItem)  -  Edit
  16:59:39.655  │  │  │  │  ├─ packetlossLastSecond (StatsItem)  -  Edit
  16:59:39.655  │  │  │  │  ├─ packetlossTotal (StatsItem)  -  Edit
  16:59:39.655  │  │  │  │  ├─ numberOfUnsplitMessages (StatsItem)  -  Edit
  16:59:39.655  │  │  │  │  ├─ numberOfSplitMessages (StatsItem)  -  Edit
  16:59:39.655  │  │  │  ├─ Send kBps (StatsItem)  -  Edit
  16:59:39.655  │  │  │  │  ├─ MtuSize (StatsItem)  -  Edit
  16:59:39.656  │  │  │  ├─ Send Buffer Health (StatsItem)  -  Edit
  16:59:39.656  │  │  │  ├─ BandwidthExceeded (StatsItem)  -  Edit
  16:59:39.656  │  │  │  ├─ CongestionControlExceeded (StatsItem)  -  Edit
  16:59:39.656  │  │  │  ├─ Receive kBps (StatsItem)  -  Edit
  16:59:39.656  │  │  │  ├─ Packet Queue (StatsItem)  -  Edit
  16:59:39.656  │  │  │  ├─ Sent Data Packets (StatsItem)  -  Edit
  16:59:39.656  │  │  │  │  ├─ Size (RunningAverageItemInt)  -  Edit
  16:59:39.656  │  │  │  │  ├─ Throttle (StatsItem)  -  Edit
  16:59:39.656  │  │  │  │  ├─ Queue Size (StatsItem)  -  Edit
  16:59:39.656  │  │  │  │  ├─ Time In Queue (StatsItem)  -  Edit
  16:59:39.656  │  │  │  │  ├─ New Items Per Sec (TotalCountTimeIntervalItem)  -  Edit
  16:59:39.656  │  │  │  │  ├─ Items Sent Per Sec (TotalCountTimeIntervalItem)  -  Edit
  16:59:39.656  │  │  │  ├─ OutPhysicsDetails (StatsItem)  -  Edit
  16:59:39.656  │  │  │  │  ├─ CFrameOnly (TotalCountTimeIntervalItem)  -  Edit
  16:59:39.656  │  │  │  │  │  ├─ Size (RunningAverageItemInt)  -  Edit
  16:59:39.656  │  │  │  │  ├─ Mechanism (TotalCountTimeIntervalItem)  -  Edit
  16:59:39.656  │  │  │  │  │  ├─ Size (RunningAverageItemInt)  -  Edit
  16:59:39.656  │  │  │  │  ├─ Translation (TotalCountTimeIntervalItem)  -  Edit
  16:59:39.656  │  │  │  │  │  ├─ Size (RunningAverageItemInt)  -  Edit
  16:59:39.656  │  │  │  │  ├─ Rotation (TotalCountTimeIntervalItem)  -  Edit
  16:59:39.656  │  │  │  │  │  ├─ Size (RunningAverageItemInt)  -  Edit
  16:59:39.656  │  │  │  │  ├─ Velocity (TotalCountTimeIntervalItem)  -  Edit
  16:59:39.656  │  │  │  │  │  ├─ Size (RunningAverageItemInt)  -  Edit
  16:59:39.656  │  │  │  ├─ InPhysicsDetails (StatsItem)  -  Edit
  16:59:39.656  │  │  │  │  ├─ CFrameOnly (TotalCountTimeIntervalItem)  -  Edit
  16:59:39.657  │  │  │  │  │  ├─ Size (RunningAverageItemInt)  -  Edit
  16:59:39.657  │  │  │  │  ├─ Mechanism (TotalCountTimeIntervalItem)  -  Edit
  16:59:39.657  │  │  │  │  │  ├─ Size (RunningAverageItemInt)  -  Edit
  16:59:39.657  │  │  │  │  ├─ Translation (TotalCountTimeIntervalItem)  -  Edit
  16:59:39.657  │  │  │  │  │  ├─ Size (RunningAverageItemInt)  -  Edit
  16:59:39.657  │  │  │  │  ├─ Rotation (TotalCountTimeIntervalItem)  -  Edit
  16:59:39.657  │  │  │  │  │  ├─ Size (RunningAverageItemInt)  -  Edit
  16:59:39.657  │  │  │  │  ├─ Velocity (TotalCountTimeIntervalItem)  -  Edit
  16:59:39.657  │  │  │  │  │  ├─ Size (RunningAverageItemInt)  -  Edit
  16:59:39.657  │  │  │  ├─ DataPingDetails (StatsItem)  -  Edit
  16:59:39.657  │  │  │  │  ├─ LQToS (StatsItem)  -  Edit
  16:59:39.657  │  │  │  │  ├─ LBcsQ (StatsItem)  -  Edit
  16:59:39.657  │  │  │  │  ├─ RakPing (StatsItem)  -  Edit
  16:59:39.657  │  │  │  │  ├─ RRakRecvToAppPop (StatsItem)  -  Edit
  16:59:39.657  │  │  │  │  ├─ RAppPopToDeserialize (StatsItem)  -  Edit
  16:59:39.657  │  │  │  │  ├─ RDeserializeToPBQ (StatsItem)  -  Edit
  16:59:39.657  │  │  │  │  ├─ RQToS (StatsItem)  -  Edit
  16:59:39.657  │  │  │  │  ├─ RBscQ (StatsItem)  -  Edit
  16:59:39.657  │  │  │  │  ├─ LRakRecvToAppPop (StatsItem)  -  Edit
  16:59:39.657  │  │  │  │  ├─ LAppPopToSerialize (StatsItem)  -  Edit
  16:59:39.657  │  │  │  │  ├─ LDeserializeToProcess (StatsItem)  -  Edit
  16:59:39.657  │  │  │  │  ├─ EstTotal (StatsItem)  -  Edit
  16:59:39.657  │  │  │  │  ├─ MeasuredTotal (StatsItem)  -  Edit
  16:59:39.657  │  │  │  │  ├─ unrelLQToS (StatsItem)  -  Edit
  16:59:39.657  │  │  │  │  ├─ unrelLBcsQ (StatsItem)  -  Edit
  16:59:39.657  │  │  │  │  ├─ unrelRakPing (StatsItem)  -  Edit
  16:59:39.657  │  │  │  │  ├─ unrelRRakRecvToAppPop (StatsItem)  -  Edit
  16:59:39.657  │  │  │  │  ├─ unrelRAppPopToDeserialize (StatsItem)  -  Edit
  16:59:39.657  │  │  │  │  ├─ unrelRDeserializeToPBQ (StatsItem)  -  Edit
  16:59:39.657  │  │  │  │  ├─ unrelRQToS (StatsItem)  -  Edit
  16:59:39.657  │  │  │  │  ├─ unrelRBscQ (StatsItem)  -  Edit
  16:59:39.657  │  │  │  │  ├─ unrelLRakRecvToAppPop (StatsItem)  -  Edit
  16:59:39.658  │  │  │  │  ├─ unrelLAppPopToSerialize (StatsItem)  -  Edit
  16:59:39.658  │  │  │  │  ├─ unrelLDeserializeToProcess (StatsItem)  -  Edit
  16:59:39.658  │  │  │  │  ├─ unrelEstTotal (StatsItem)  -  Edit
  16:59:39.658  │  │  │  │  ├─ unrelMeasuredTotal (StatsItem)  -  Edit
  16:59:39.658  │  │  │  ├─ Send Data Types (StatsItem)  -  Edit
  16:59:39.658  │  │  │  │  ├─ InstanceNew (TotalCountTimeIntervalItem)  -  Edit
  16:59:39.658  │  │  │  │  │  ├─ Size (RunningAverageItemInt)  -  Edit
  16:59:39.658  │  │  │  │  ├─ InstanceDelete (TotalCountTimeIntervalItem)  -  Edit
  16:59:39.658  │  │  │  │  │  ├─ Size (RunningAverageItemInt)  -  Edit
  16:59:39.658  │  │  │  │  ├─ Ping (TotalCountTimeIntervalItem)  -  Edit
  16:59:39.658  │  │  │  │  │  ├─ Size (RunningAverageItemInt)  -  Edit
  16:59:39.658  │  │  │  │  ├─ Data (TotalCountTimeIntervalItem)  -  Edit
  16:59:39.658  │  │  │  │  │  ├─ Size (RunningAverageItemInt)  -  Edit
  16:59:39.658  │  │  │  │  ├─ Behavior (TotalCountTimeIntervalItem)  -  Edit
  16:59:39.658  │  │  │  │  │  ├─ Size (RunningAverageItemInt)  -  Edit
  16:59:39.658  │  │  │  │  ├─ State (TotalCountTimeIntervalItem)  -  Edit
  16:59:39.658  │  │  │  │  │  ├─ Size (RunningAverageItemInt)  -  Edit
  16:59:39.658  │  │  │  │  ├─ Appearance (TotalCountTimeIntervalItem)  -  Edit
  16:59:39.658  │  │  │  │  │  ├─ Size (RunningAverageItemInt)  -  Edit
  16:59:39.658  │  │  │  │  ├─ Team (TotalCountTimeIntervalItem)  -  Edit
  16:59:39.658  │  │  │  │  │  ├─ Size (RunningAverageItemInt)  -  Edit
  16:59:39.658  │  │  │  │  ├─ Video (TotalCountTimeIntervalItem)  -  Edit
  16:59:39.658  │  │  │  │  │  ├─ Size (RunningAverageItemInt)  -  Edit
  16:59:39.658  │  │  │  │  ├─ Control (TotalCountTimeIntervalItem)  -  Edit
  16:59:39.658  │  │  │  │  │  ├─ Size (RunningAverageItemInt)  -  Edit
  16:59:39.658  │  │  │  │  ├─ Events (TotalCountTimeIntervalItem)  -  Edit
  16:59:39.658  │  │  │  │  │  ├─ Size (RunningAverageItemInt)  -  Edit
  16:59:39.659  │  │  │  │  ├─ InstanceDestroy (TotalCountTimeIntervalItem)  -  Edit
  16:59:39.659  │  │  │  │  │  ├─ Size (RunningAverageItemInt)  -  Edit
  16:59:39.659  │  │  │  ├─ Received Data Types (StatsItem)  -  Edit
  16:59:39.659  │  │  │  │  ├─ InstanceNew (TotalCountTimeIntervalItem)  -  Edit
  16:59:39.659  │  │  │  │  │  ├─ Size (RunningAverageItemInt)  -  Edit
  16:59:39.659  │  │  │  │  ├─ InstanceDelete (TotalCountTimeIntervalItem)  -  Edit
  16:59:39.659  │  │  │  │  │  ├─ Size (RunningAverageItemInt)  -  Edit
  16:59:39.659  │  │  │  │  ├─ Ping (TotalCountTimeIntervalItem)  -  Edit
  16:59:39.659  │  │  │  │  │  ├─ Size (RunningAverageItemInt)  -  Edit
  16:59:39.659  │  │  │  │  ├─ Data (TotalCountTimeIntervalItem)  -  Edit
  16:59:39.659  │  │  │  │  │  ├─ Size (RunningAverageItemInt)  -  Edit
  16:59:39.659  │  │  │  │  ├─ Behavior (TotalCountTimeIntervalItem)  -  Edit
  16:59:39.659  │  │  │  │  │  ├─ Size (RunningAverageItemInt)  -  Edit
  16:59:39.659  │  │  │  │  ├─ State (TotalCountTimeIntervalItem)  -  Edit
  16:59:39.659  │  │  │  │  │  ├─ Size (RunningAverageItemInt)  -  Edit
  16:59:39.659  │  │  │  │  ├─ Appearance (TotalCountTimeIntervalItem)  -  Edit
  16:59:39.659  │  │  │  │  │  ├─ Size (RunningAverageItemInt)  -  Edit
  16:59:39.659  │  │  │  │  ├─ Team (TotalCountTimeIntervalItem)  -  Edit
  16:59:39.659  │  │  │  │  │  ├─ Size (RunningAverageItemInt)  -  Edit
  16:59:39.659  │  │  │  │  ├─ Video (TotalCountTimeIntervalItem)  -  Edit
  16:59:39.659  │  │  │  │  │  ├─ Size (RunningAverageItemInt)  -  Edit
  16:59:39.659  │  │  │  │  ├─ Control (TotalCountTimeIntervalItem)  -  Edit
  16:59:39.659  │  │  │  │  │  ├─ Size (RunningAverageItemInt)  -  Edit
  16:59:39.659  │  │  │  │  ├─ Events (TotalCountTimeIntervalItem)  -  Edit
  16:59:39.659  │  │  │  │  │  ├─ Size (RunningAverageItemInt)  -  Edit
  16:59:39.659  │  │  │  │  ├─ InstanceDestroy (TotalCountTimeIntervalItem)  -  Edit
  16:59:39.659  │  │  │  │  │  ├─ Size (RunningAverageItemInt)  -  Edit
  16:59:39.659  │  │  │  ├─ Sent Physics Packets (StatsItem)  -  Edit
  16:59:39.659  │  │  │  │  ├─ Size (RunningAverageItemInt)  -  Edit
  16:59:39.660  │  │  │  │  ├─ Throttle (StatsItem)  -  Edit
  16:59:39.660  │  │  │  │  ├─ Smoothed (StatsItem)  -  Edit
  16:59:39.660  │  │  │  │  ├─ Items Per Packet (RunningAverageItemInt)  -  Edit
  16:59:39.660  │  │  │  ├─ SentTouchPackets (StatsItem)  -  Edit
  16:59:39.660  │  │  │  │  ├─ Size (RunningAverageItemInt)  -  Edit
  16:59:39.660  │  │  │  │  ├─ WaitingTouches (RunningAverageItemInt)  -  Edit
  16:59:39.660  │  │  │  ├─ Received Packets (StatsItem)  -  Edit
  16:59:39.660  │  │  │  ├─ Received Data Packets (StatsItem)  -  Edit
  16:59:39.660  │  │  │  │  ├─ Queue Size (StatsItem)  -  Edit
  16:59:39.660  │  │  │  │  ├─ Instance Size (StatsItem)  -  Edit
  16:59:39.660  │  │  │  │  ├─ Waiting Refs (StatsItem)  -  Edit
  16:59:39.660  │  │  │  │  ├─ Size (StatsItem)  -  Edit
  16:59:39.660  │  │  │  ├─ Received Physics Packets (StatsItem)  -  Edit
  16:59:39.660  │  │  │  │  ├─ Average Lag (StatsItem)  -  Edit
  16:59:39.660  │  │  │  │  ├─ Average Buffer Seek (StatsItem)  -  Edit
  16:59:39.660  │  │  │  │  ├─ Max Buffer Seek (StatsItem)  -  Edit
  16:59:39.660  │  │  │  │  ├─ Wrong Order (StatsItem)  -  Edit
  16:59:39.660  │  │  │  │  ├─ Size (StatsItem)  -  Edit
  16:59:39.660  │  │  │  ├─ Sent Cluster Packets (StatsItem)  -  Edit
  16:59:39.660  │  │  │  │  ├─ Size (RunningAverageItemInt)  -  Edit
  16:59:39.660  │  │  │  ├─ Received Cluster Packets (StatsItem)  -  Edit
  16:59:39.660  │  │  │  │  ├─ Size (StatsItem)  -  Edit
  16:59:39.660  │  │  │  ├─ Received Touch Packets (StatsItem)  -  Edit
  16:59:39.660  │  │  │  │  ├─ Size (StatsItem)  -  Edit
  16:59:39.660  │  │  │  ├─ ElapsedTime (StatsItem)  -  Edit
  16:59:39.660  │  │  │  ├─ MaxPacketLoss (StatsItem)  -  Edit
  16:59:39.660  │  │  │  ├─ TotalInDataBW (StatsItem)  -  Edit
  16:59:39.661  │  │  │  ├─ TotalOutDataBW (StatsItem)  -  Edit
  16:59:39.661  │  │  │  ├─ TotalRakIn (StatsItem)  -  Edit
  16:59:39.661  │  │  │  ├─ TotalRakOut (StatsItem)  -  Edit
  16:59:39.661  │  │  │  ├─ OutBufferHealth (StatsItem)  -  Edit
  16:59:39.661  │  │  │  ├─ PropSync (StatsItem)  -  Edit
  16:59:39.661  │  │  │  │  ├─ ItemCount (StatsItem)  -  Edit
  16:59:39.661  │  │  │  │  ├─ AckCount (StatsItem)  -  Edit
  16:59:39.661  │  │  │  ├─ Received Stream Data (StatsItem)  -  Edit
  16:59:39.661  │  │  │  │  ├─ AvgReadTimePerItem (RunningAverageItemDouble)  -  Edit
  16:59:39.661  │  │  │  │  ├─ AvgInstancesPerItem (RunningAverageItemDouble)  -  Edit
  16:59:39.661  │  │  │  │  ├─ RequestedInstanceAvg (RunningAverageItemInt)  -  Edit
  16:59:39.661  │  │  │  │  ├─ PendingRequestCount (StatsItem)  -  Edit
  16:59:39.661  │  │  │  │  ├─ NumRegionsToGC (StatsItem)  -  Edit
  16:59:39.661  │  │  │  │  ├─ GCDistance (StatsItem)  -  Edit
  16:59:39.661  │  │  │  │  ├─ NumRegions (StatsItem)  -  Edit
  16:59:39.661  │  ├─ Lua (StatsItem)  -  Edit
  16:59:39.661  │  │  ├─ disabled (StatsItem)  -  Edit
  16:59:39.661  │  │  ├─ threads (StatsItem)  -  Edit
  16:59:39.661  │  │  ├─ AverageGcInterval (StatsItem)  -  Edit
  16:59:39.661  │  │  ├─ AverageGcTime (StatsItem)  -  Edit
  16:59:39.661  │  ├─ FrameRateManager (StatsItem)  -  Edit
  16:59:39.661  │  │  ├─ DeviceFeatureLevel (StatsItem)  -  Edit
  16:59:39.661  │  │  ├─ DeviceShadingLanguage (StatsItem)  -  Edit
  16:59:39.661  │  │  ├─ AverageQualityLevel (StatsItem)  -  Edit
  16:59:39.661  │  │  ├─ AutoQuality (StatsItem)  -  Edit
  16:59:39.662  │  │  ├─ NumberOfSettles (StatsItem)  -  Edit
  16:59:39.662  │  │  ├─ AverageSwitches (StatsItem)  -  Edit
  16:59:39.662  │  │  ├─ FramebufferWidth (StatsItem)  -  Edit
  16:59:39.662  │  │  ├─ FramebufferHeight (StatsItem)  -  Edit
  16:59:39.662  │  │  ├─ Batches (StatsItem)  -  Edit
  16:59:39.662  │  │  ├─ Indices (StatsItem)  -  Edit
  16:59:39.662  │  │  ├─ MaterialChanges (StatsItem)  -  Edit
  16:59:39.662  │  │  ├─ VideoMemoryInMB (StatsItem)  -  Edit
  16:59:39.662  │  │  ├─ AverageFPS (StatsItem)  -  Edit
  16:59:39.662  │  │  ├─ FrameTimeVariance (StatsItem)  -  Edit
  16:59:39.662  │  │  ├─ FrameSpikeCount (StatsItem)  -  Edit
  16:59:39.662  │  │  ├─ RenderAverage (StatsItem)  -  Edit
  16:59:39.662  │  │  ├─ PrepareAverage (StatsItem)  -  Edit
  16:59:39.662  │  │  ├─ PerformAverage (StatsItem)  -  Edit
  16:59:39.662  │  │  ├─ AveragePresent (StatsItem)  -  Edit
  16:59:39.662  │  │  ├─ AverageGPU (StatsItem)  -  Edit
  16:59:39.662  │  │  ├─ RenderThreadAverage (StatsItem)  -  Edit
  16:59:39.662  │  │  ├─ TotalFrameWallAverage (StatsItem)  -  Edit
  16:59:39.662  │  │  ├─ PerformVariance (StatsItem)  -  Edit
  16:59:39.662  │  │  ├─ PresentVariance (StatsItem)  -  Edit
  16:59:39.662  │  │  ├─ GpuVariance (StatsItem)  -  Edit
  16:59:39.662  │  │  ├─ MsFrame0 (StatsItem)  -  Edit
  16:59:39.662  │  │  ├─ MsFrame1 (StatsItem)  -  Edit
  16:59:39.662  │  │  ├─ MsFrame2 (StatsItem)  -  Edit
  16:59:39.662  │  │  ├─ MsFrame3 (StatsItem)  -  Edit
  16:59:39.662  │  │  ├─ MsFrame4 (StatsItem)  -  Edit
  16:59:39.662  │  │  ├─ MsFrame5 (StatsItem)  -  Edit
  16:59:39.662  │  │  ├─ MsFrame6 (StatsItem)  -  Edit
  16:59:39.662  │  │  ├─ MsFrame7 (StatsItem)  -  Edit
  16:59:39.662  │  │  ├─ MsFrame8 (StatsItem)  -  Edit
  16:59:39.662  │  │  ├─ MsFrame9 (StatsItem)  -  Edit
  16:59:39.662  │  │  ├─ MsFrame10 (StatsItem)  -  Edit
  16:59:39.663  │  │  ├─ MsFrame11 (StatsItem)  -  Edit
  16:59:39.663  │  ├─ Render (StatsItem)  -  Edit
  16:59:39.663  │  │  ├─ Memory (StatsItem)  -  Edit
  16:59:39.663  │  │  │  ├─ Video (StatsItem)  -  Edit
  16:59:39.663  ├─ TimerService (TimerService)  -  Edit
  16:59:39.663  ├─ SoundService (SoundService)  -  Edit
  16:59:39.663  ├─ VideoCaptureService (VideoCaptureService)  -  Edit
  16:59:39.663  ├─ LogService (LogService)  -  Edit
  16:59:39.663  ├─ ContentProvider (ContentProvider)  -  Edit
  16:59:39.663  ├─ KeyframeSequenceProvider (KeyframeSequenceProvider)  -  Edit
  16:59:39.663  ├─ AnimationClipProvider (AnimationClipProvider)  -  Edit
  16:59:39.663  ├─ Chat (Chat)  -  Edit
  16:59:39.663  ├─ MarketplaceService (MarketplaceService)  -  Edit
  16:59:39.663  ├─ Players (Players)  -  Edit
  16:59:39.663  │  ├─ sub2vesp (Player)  -  Edit
  16:59:39.663  │  │  ├─ PlayerScripts (PlayerScripts)  -  Edit
  16:59:39.663  │  │  ├─ Backpack (Backpack)  -  Edit
  16:59:39.663  ├─ PointsService (PointsService)  -  Edit
  16:59:39.663  ├─ NotificationService (NotificationService)  -  Edit
  16:59:39.663  ├─ ReplicatedFirst (ReplicatedFirst)  -  Edit
  16:59:39.663  ├─ HttpRbxApiService (HttpRbxApiService)  -  Edit
  16:59:39.663  ├─ TweenService (TweenService)  -  Edit
  16:59:39.663  ├─ MaterialService (MaterialService)  -  Edit
  16:59:39.663  ├─ TextChatService (TextChatService)  -  Edit
  16:59:39.663  │  ├─ ChatWindowConfiguration (ChatWindowConfiguration)  -  Edit
  16:59:39.663  │  ├─ ChatInputBarConfiguration (ChatInputBarConfiguration)  -  Edit
  16:59:39.663  │  ├─ BubbleChatConfiguration (BubbleChatConfiguration)  -  Edit
  16:59:39.663  │  │  ├─ UIGradient (UIGradient)  -  Edit
  16:59:39.663  │  │  ├─ ImageLabel (ImageLabel)  -  Edit
  16:59:39.663  │  │  ├─ UICorner (UICorner)  -  Edit
  16:59:39.663  │  │  ├─ UIPadding (UIPadding)  -  Edit
  16:59:39.664  │  ├─ ChannelTabsConfiguration (ChannelTabsConfiguration)  -  Edit
  16:59:39.664  ├─ TextService (TextService)  -  Edit
  16:59:39.664  ├─ PermissionsService (PermissionsService)  -  Edit
  16:59:39.664  ├─ SharedTableRegistry (SharedTableRegistry)  -  Edit
  16:59:39.664  ├─ StarterPlayer (StarterPlayer)  -  Edit
  16:59:39.664  │  ├─ StarterPlayerScripts (StarterPlayerScripts)  -  Edit
  16:59:39.664  │  ├─ StarterCharacterScripts (StarterCharacterScripts)  -  Edit
  16:59:39.664  ├─ StarterPack (StarterPack)  -  Edit
  16:59:39.664  ├─ StarterGui (StarterGui)  -  Edit
  16:59:39.664  │  ├─ UI (Folder)  -  Edit
  16:59:39.664  │  │  ├─ StickRevealUI (ScreenGui)  -  Edit
  16:59:39.664  │  │  │  ├─ StickTitle (TextBox)  -  Edit
  16:59:39.664  │  │  │  │  ├─ UIGradient (UIGradient)  -  Edit
  16:59:39.664  │  │  │  ├─ EditIcon (ImageLabel)  -  Edit
  16:59:39.664  │  │  │  ├─ Divider (Frame)  -  Edit
  16:59:39.664  │  │  │  │  ├─ UIGradient (UIGradient)  -  Edit
  16:59:39.664  │  │  │  ├─ Highlight2 (Frame)  -  Edit
  16:59:39.664  │  │  │  │  ├─ UIGradient (UIGradient)  -  Edit
  16:59:39.664  │  │  │  ├─ ViewportFrame (ViewportFrame)  -  Edit
  16:59:39.664  │  │  │  ├─ StatsGroup (CanvasGroup)  -  Edit
  16:59:39.664  │  │  │  │  ├─ Traits (CanvasGroup)  -  Edit
  16:59:39.664  │  │  │  │  │  ├─ Label (TextLabel)  -  Edit
  16:59:39.664  │  │  │  │  │  │  ├─ UIGradient (UIGradient)  -  Edit
  16:59:39.664  │  │  │  │  │  ├─ Value (TextLabel)  -  Edit
  16:59:39.664  │  │  │  │  │  │  ├─ UIGradient (UIGradient)  -  Edit
  16:59:39.664  │  │  │  │  ├─ Rarity (CanvasGroup)  -  Edit
  16:59:39.664  │  │  │  │  │  ├─ Label (TextLabel)  -  Edit
  16:59:39.665  │  │  │  │  │  │  ├─ UIGradient (UIGradient)  -  Edit
  16:59:39.665  │  │  │  │  │  ├─ Value (TextLabel)  -  Edit
  16:59:39.665  │  │  │  │  │  │  ├─ UIGradient (UIGradient)  -  Edit
  16:59:39.665  │  │  │  │  ├─ Enchant (CanvasGroup)  -  Edit
  16:59:39.665  │  │  │  │  │  ├─ Label (TextLabel)  -  Edit
  16:59:39.665  │  │  │  │  │  │  ├─ UIGradient (UIGradient)  -  Edit
  16:59:39.665  │  │  │  │  │  ├─ Value (TextLabel)  -  Edit
  16:59:39.665  │  │  │  │  │  │  ├─ UIGradient (UIGradient)  -  Edit
  16:59:39.665  │  │  │  │  ├─ Wear (CanvasGroup)  -  Edit
  16:59:39.665  │  │  │  │  │  ├─ Label (TextLabel)  -  Edit
  16:59:39.665  │  │  │  │  │  │  ├─ UIGradient (UIGradient)  -  Edit
  16:59:39.665  │  │  │  │  │  ├─ Value (TextLabel)  -  Edit
  16:59:39.665  │  │  │  │  │  │  ├─ UIGradient (UIGradient)  -  Edit
  16:59:39.665  │  │  │  │  ├─ Size (CanvasGroup)  -  Edit
  16:59:39.665  │  │  │  │  │  ├─ Label (TextLabel)  -  Edit
  16:59:39.665  │  │  │  │  │  │  ├─ UIGradient (UIGradient)  -  Edit
  16:59:39.665  │  │  │  │  │  ├─ Value (TextLabel)  -  Edit
  16:59:39.665  │  │  │  │  │  │  ├─ UIGradient (UIGradient)  -  Edit
  16:59:39.665  │  │  │  │  ├─ Spirit (CanvasGroup)  -  Edit
  16:59:39.665  │  │  │  │  │  ├─ Label (TextLabel)  -  Edit
  16:59:39.665  │  │  │  │  │  │  ├─ UIGradient (UIGradient)  -  Edit
  16:59:39.665  │  │  │  │  │  ├─ Value (TextLabel)  -  Edit
  16:59:39.665  │  │  │  │  │  │  ├─ UIGradient (UIGradient)  -  Edit
  16:59:39.665  │  │  │  ├─ Lore (TextLabel)  -  Edit
  16:59:39.665  │  │  │  │  ├─ UIGradient (UIGradient)  -  Edit
  16:59:39.665  │  │  │  ├─ CollectButton (TextButton)  -  Edit
  16:59:39.666  │  │  │  │  ├─ UICorner (UICorner)  -  Edit
  16:59:39.666  │  │  │  │  ├─ UIStroke (UIStroke)  -  Edit
  16:59:39.666  │  │  │  │  │  ├─ UIGradient (UIGradient)  -  Edit
  16:59:39.666  │  │  │  │  ├─ UIGradient (UIGradient)  -  Edit
  16:59:39.666  │  │  │  ├─ DropButton (TextButton)  -  Edit
  16:59:39.666  │  │  │  │  ├─ UICorner (UICorner)  -  Edit
  16:59:39.666  │  │  │  │  ├─ UIStroke (UIStroke)  -  Edit
  16:59:39.666  │  │  │  │  │  ├─ UIGradient (UIGradient)  -  Edit
  16:59:39.666  │  │  │  │  ├─ UIGradient (UIGradient)  -  Edit
  16:59:39.666  │  │  │  ├─ Chance (TextLabel)  -  Edit
  16:59:39.666  │  │  │  │  ├─ UIGradient (UIGradient)  -  Edit
  16:59:39.666  │  │  │  ├─ Highlight3 (ImageLabel)  -  Edit
  16:59:39.666  │  │  │  ├─ SkipWarning (TextLabel)  -  Edit
  16:59:39.666  │  │  ├─ InventoryUI (ScreenGui)  -  Edit
  16:59:39.666  │  │  │  ├─ BackgroundFrame (CanvasGroup)  -  Edit
  16:59:39.666  │  │  │  │  ├─ UICorner (UICorner)  -  Edit
  16:59:39.666  │  │  │  │  ├─ UIStroke (UIStroke)  -  Edit
  16:59:39.666  │  │  │  │  ├─ Sidebar (CanvasGroup)  -  Edit
  16:59:39.666  │  │  │  │  │  ├─ Top (CanvasGroup)  -  Edit
  16:59:39.666  │  │  │  │  │  │  ├─ UIStroke (UIStroke)  -  Edit
  16:59:39.666  │  │  │  │  │  │  ├─ Title (TextLabel)  -  Edit
  16:59:39.666  │  │  │  │  │  │  │  ├─ UIGradient (UIGradient)  -  Edit
  16:59:39.666  │  │  │  │  │  │  ├─ Icon (ImageLabel)  -  Edit
  16:59:39.666  │  │  │  │  │  │  │  ├─ UIGradient (UIGradient)  -  Edit
  16:59:39.666  │  │  │  │  │  ├─ UIStroke (UIStroke)  -  Edit
  16:59:39.666  │  │  │  │  │  ├─ Bottom (CanvasGroup)  -  Edit
  16:59:39.666  │  │  │  │  │  │  ├─ UIStroke (UIStroke)  -  Edit
  16:59:39.666  │  │  │  │  │  │  ├─ Username (TextLabel)  -  Edit
  16:59:39.666  │  │  │  │  │  │  │  ├─ UIGradient (UIGradient)  -  Edit
  16:59:39.666  │  │  │  │  │  │  ├─ Icon (ImageLabel)  -  Edit
  16:59:39.667  │  │  │  │  │  │  │  ├─ UIGradient (UIGradient)  -  Edit
  16:59:39.667  │  │  │  │  │  │  ├─ Coins (TextLabel)  -  Edit
  16:59:39.667  │  │  │  │  │  │  │  ├─ UIGradient (UIGradient)  -  Edit
  16:59:39.667  │  │  │  │  │  │  ├─ Crescents (TextLabel)  -  Edit
  16:59:39.667  │  │  │  │  │  │  │  ├─ UIGradient (UIGradient)  -  Edit
  16:59:39.667  │  │  │  │  │  │  ├─ Caught (TextLabel)  -  Edit
  16:59:39.667  │  │  │  │  │  │  │  ├─ UIGradient (UIGradient)  -  Edit
  16:59:39.667  │  │  │  │  │  │  ├─ Profile (CanvasGroup)  -  Edit
  16:59:39.667  │  │  │  │  │  │  │  ├─ UICorner (UICorner)  -  Edit
  16:59:39.667  │  │  │  │  │  │  │  ├─ ProfileIcon (ImageLabel)  -  Edit
  16:59:39.667  │  │  │  │  │  ├─ UIGradient (UIGradient)  -  Edit
  16:59:39.667  │  │  │  │  │  ├─ List (CanvasGroup)  -  Edit
  16:59:39.667  │  │  │  │  │  │  ├─ Sticks (TextButton)  -  Edit
  16:59:39.667  │  │  │  │  │  │  │  ├─ UICorner (UICorner)  -  Edit
  16:59:39.667  │  │  │  │  │  │  │  ├─ UIStroke (UIStroke)  -  Edit
  16:59:39.667  │  │  │  │  │  │  │  ├─ UIGradient (UIGradient)  -  Edit
  16:59:39.667  │  │  │  │  │  │  ├─ UIGradient (UIGradient)  -  Edit
  16:59:39.667  │  │  │  │  │  │  ├─ Keepsake (TextButton)  -  Edit
  16:59:39.667  │  │  │  │  │  │  │  ├─ UICorner (UICorner)  -  Edit
  16:59:39.667  │  │  │  │  │  │  │  ├─ UIStroke (UIStroke)  -  Edit
  16:59:39.667  │  │  │  │  │  │  │  ├─ UIGradient (UIGradient)  -  Edit
  16:59:39.667  │  │  │  │  │  │  ├─ Trinkets (TextButton)  -  Edit
  16:59:39.667  │  │  │  │  │  │  │  ├─ UICorner (UICorner)  -  Edit
  16:59:39.667  │  │  │  │  │  │  │  ├─ UIStroke (UIStroke)  -  Edit
  16:59:39.667  │  │  │  │  │  │  │  ├─ UIGradient (UIGradient)  -  Edit
  16:59:39.667  │  │  │  │  ├─ MainFrame (Frame)  -  Edit
  16:59:39.667  │  │  │  │  │  ├─ UICorner (UICorner)  -  Edit
  16:59:39.667  │  │  │  │  │  ├─ UIGradient (UIGradient)  -  Edit
  16:59:39.667  │  │  │  │  │  ├─ UIStroke (UIStroke)  -  Edit
  16:59:39.668  │  │  │  │  │  ├─ SlotTemplate (CanvasGroup)  -  Edit
  16:59:39.668  │  │  │  │  │  │  ├─ UICorner (UICorner)  -  Edit
  16:59:39.668  │  │  │  │  │  │  ├─ UIStroke (UIStroke)  -  Edit
  16:59:39.668  │  │  │  │  │  │  ├─ CanvasGroup (CanvasGroup)  -  Edit
  16:59:39.668  │  │  │  │  │  │  │  ├─ Title (TextLabel)  -  Edit
  16:59:39.668  │  │  │  │  │  │  │  │  ├─ UIPadding (UIPadding)  -  Edit
  16:59:39.668  │  │  │  │  │  │  │  ├─ UIStroke (UIStroke)  -  Edit
  16:59:39.668  │  │  │  │  │  │  ├─ ViewportFrame (ViewportFrame)  -  Edit
  16:59:39.668  │  │  │  │  │  ├─ Capacity (TextLabel)  -  Edit
  16:59:39.668  │  │  │  │  │  │  ├─ UIGradient (UIGradient)  -  Edit
  16:59:39.668  │  ├─ UIScripts (Folder)  -  Edit
  16:59:39.668  ├─ CoreGui (CoreGui)  -  Edit
  16:59:39.668  │  ├─ RobloxGui (ScreenGui)  -  Edit
  16:59:39.668  │  │  ├─ ControlFrame (Frame)  -  Edit
  16:59:39.668  │  │  │  ├─ BottomLeftControl (Frame)  -  Edit
  16:59:39.668  │  │  │  ├─ BottomRightControl (Frame)  -  Edit
  16:59:39.668  │  │  │  ├─ TopLeftControl (Frame)  -  Edit
  16:59:39.668  │  │  ├─ Modules (Folder)  -  Edit
  16:59:39.668  local function printDescendants(object, indent)
	indent = indent or ""
	for _, child in ipairs(object:GetChildren()) do
		local typeName = child:IsA("ModuleScript") or child:IsA("Script") or child:IsA("LocalScript") and "Script" or child.ClassName
		local:5: invalid argument #4 to 'format' (string expected, got boolean)  -  Edit
  16:59:39.668  Stack Begin  -  Studio
  16:59:39.668  Script 'local function printDescendants(object, indent)
	indent = indent or ""
	for _, child in ipairs(object:GetChildren()) do
		local typeName = child:IsA("ModuleScript") or child:IsA("Script") or child:IsA("LocalScript") and "Script" or child.ClassName
		local', Line 5 - function printDescendants  -  Studio
  16:59:39.668   ▶ Script 'local function printDescendants(object, indent)
	indent = indent or ""
	for _, child in ipairs(object:GetChildren()) do
		local typeName = child:IsA("ModuleScript") or child:IsA("Script") or child:IsA("LocalScript") and "Script" or child.ClassName
		local', Line 7 - function printDescendants (x3)  -  Studio
  16:59:39.668  Script 'local function printDescendants(object, indent)
	indent = indent or ""
	for _, child in ipairs(object:GetChildren()) do
		local typeName = child:IsA("ModuleScript") or child:IsA("Script") or child:IsA("LocalScript") and "Script" or child.ClassName
		local', Line 12  -  Studio
  16:59:39.669  Stack End  -  Studio
