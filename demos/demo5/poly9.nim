import
  nimgame2/nimgame,
  nimgame2/collider,
  nimgame2/entity

type
  Poly9* = ref object of Entity
    collidedWith*: seq[string]


proc init*(entity: Poly9) =
  entity.initEntity()
  entity.tags.add("Poly9")
  entity.center = (40.0, 50.0)
  entity.collider = entity.newPolyCollider((0.0, 0.0),
    [ (0.0,   0.0),
      (20.0,  0.0),
      (10.0,  70.0),
      (70.0,  70.0),
      (60.0,  0.0),
      (80.0,  0.0),
      (80.0,  80.0),
      (40.0,  100.0),
      (0.0,   80.0)])
  entity.collidedWith = @[]


proc newPoly9*(): Poly9 =
  result = new Poly9
  result.init()


method update*(entity: Poly9, elapsed: float) =
  entity.updateEntity(elapsed)
  entity.collidedWith = @[]


method onCollide*(entity: Poly9, target: Entity) =
  if target.tags.len > 0:
    entity.collidedWith.add(target.tags[0])

