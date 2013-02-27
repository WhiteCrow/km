def build_nested_query(target_class, polymorphic_type_name, polymorphic_id_name, relation_name)
  ids_method_name = "#{relation_name.to_s.singularize}_ids
  ids = self.send ids_method_name
  relation_class_name = relation_name.to_s.singularize.capitalize
  target_class.where(polymorphic_type_name => relation_class_name, polymorphic_id_name => ids)
end

#i.e. : Space.build_nested_query(ReputationSystem::Evaluation, :target_type, :target_id, 'tiles').to_sql
#get  : SELECT "tiles".id FROM "tiles" INNER JOIN "tracks" ON "tiles"."track_id" = "tracks"."id" WHERE "tracks"."space_id" = 7
# SELECT "rs_evaluations".* FROM "rs_evaluations" WHERE "rs_evaluations"."target_type" = 'Tile' AND "rs_evaluations"."target_id" IN (136, 127, 85, 141, 297, 94)
