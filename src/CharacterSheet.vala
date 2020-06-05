using Gee;

namespace DungeonJournal
{
    public class CharacterSheet : Object, Json.Serializable
    {
        // Info
        public string name { get; set; default=""; }
        public string class { get; set; default=""; }
        public string race { get; set; default=""; }
        public int alignment { get; set; default=3; }
        public double level { get; set; default=1; }
        public double xp { get; set; default=0; }

        // Stats
        public double proficiency_bonus { get; set; default=2; }
        public double armor_class { get; set; default=0; }
        public double initiative { get; set; default=0; }
        public double speed { get; set; default=0; }
        public double hp_max { get; set; default=0; }
        public double hp_current { get; set; default=0; }
        public double hp_temp { get; set; default=0; }
        public int hit_dice { get; set; default=0; }

        // Abiltiy
        public double strength_score { get; set; default=8.0; }
        public double dexterity_score { get; set; default=8.0; }
        public double constitution_score { get; set; default=8.0; }
        public double intelligence_score { get; set; default=8.0; }
        public double wisdom_score { get; set; default=8.0; }
        public double charisma_score { get; set; default=8.0; }

        public bool strength_save_proficiency { get; set; }
        public double strength_save { get; set; default=0; }

        public bool dexterity_save_proficiency { get; set; }
        public double dexterity_save { get; set; default=0; }

        public bool constitution_save_proficiency { get; set; }
        public double constitution_save { get; set; default=0; }

        public bool intelligence_save_proficiency { get; set; }
        public double intelligence_save { get; set; default=0; }

        public bool wisdom_save_proficiency { get; set; }
        public double wisdom_save { get; set; default=0; }

        public bool charisma_save_proficiency { get; set; }
        public double charisma_save { get; set; default=0; }

        // Skills
        public bool athletics_skill_proficiency { get; set; }
        public double athletics_skill { get; set; default=0; }

        public bool acrobatics_skill_proficiency { get; set; }
        public double acrobatics_skill { get; set; default=0; }

        public bool sleight_of_hand_skill_proficiency { get; set; }
        public double sleight_of_hand_skill { get; set; default=0; }

        public bool stealth_skill_proficiency { get; set; }
        public double stealth_skill { get; set; default=0; }

        public bool arcana_skill_proficiency { get; set; }
        public double arcana_skill { get; set; default=0; }

        public bool history_skill_proficiency { get; set; }
        public double history_skill { get; set; default=0; }

        public bool investigation_skill_proficiency { get; set; }
        public double investigation_skill { get; set; default=0; }

        public bool nature_skill_proficiency { get; set; }
        public double nature_skill { get; set; default=0; }

        public bool religion_skill_proficiency { get; set; }
        public double religion_skill { get; set; default=0; }

        public bool animal_handling_skill_proficiency { get; set; }
        public double animal_handling_skill { get; set; default=0; }

        public bool insight_skill_proficiency { get; set; }
        public double insight_skill { get; set; default=0; }

        public bool medicine_skill_proficiency { get; set; }
        public double medicine_skill { get; set; default=0; }

        public bool perception_skill_proficiency { get; set; }
        public double perception_skill { get; set; default=0; }

        public bool survival_skill_proficiency { get; set; }
        public double survival_skill { get; set; default=0; }

        public bool deception_skill_proficiency { get; set; }
        public double deception_skill { get; set; default=0; }

        public bool intimidation_skill_proficiency { get; set; }
        public double intimidation_skill { get; set; default=0; }

        public bool performance_skill_proficiency { get; set; }
        public double performance_skill { get; set; default=0; }

        public bool persuasion_skill_proficiency { get; set; }
        public double persuasion_skill { get; set; default=0; }

        // Feats
        public ArrayList<CharacterFeat> feats { get; set; default=new ArrayList<CharacterFeat>(); }

        // Currency
        public double currency_copper { get; set; default=0; }
        public double currency_silver { get; set; default=0; }
        public double currency_gold { get; set; default=0; }

        // Attacks
        public ArrayList<CharacterAttack> attacks { get; set; default=new ArrayList<CharacterAttack>(); }

        public void bind(string source_prop, GLib.Object target, string target_prop)
        {
            this.bind_property(
                source_prop,
                target,
                target_prop,
                Util.BINDING_FLAGS
            );
        }

        public override Json.Node serialize_property(string property_name, Value value, ParamSpec pspec)
        {
            if (value.type().is_a(typeof(ArrayList)))
            {
                unowned ArrayList<Object> list_value = value as ArrayList<GLib.Object>;

                if (list_value != null)
                {
                    var array = new Json.Array.sized(list_value.size);

                    foreach (var item in list_value)
                    {
                        array.add_element(Json.gobject_serialize(item));
                    }

                    var node = new Json.Node(Json.NodeType.ARRAY);
                    node.set_array(array);

                    return node;
                }
            }

            return default_serialize_property(property_name, @value, pspec);
        }

        public override bool deserialize_property(string property_name, out Value @value, ParamSpec pspec, Json.Node property_node)
        {
            // json-glib currently has an issue in v1.4 where default_deserialize_property fails.
            // https://gitlab.gnome.org/GNOME/json-glib/-/issues/39
            // So pspec.value_type checks are done that shouldn't be needed in future.

            if (property_name == "feats")
            {
                var feats = new ArrayList<CharacterFeat>();

                property_node.get_array().foreach_element((arr, idx, node) =>{
                    var feat = Json.gobject_deserialize(typeof(CharacterFeat), node) as CharacterFeat;
                    assert(feat != null);
                    feats.add(feat);
                });

                value = feats;
            }
            else if (pspec.value_type == typeof(string))
            {
                value = property_node.get_string();
            }
            else if (pspec.value_type == typeof(bool))
            {
                value = property_node.get_boolean();
            }
            else if (pspec.value_type == typeof(int))
            {
                value = property_node.get_int();
            }
            else if (pspec.value_type == typeof(double))
            {
                value = property_node.get_double();
            }
            else
            {
                return default_deserialize_property(property_name, out @value, pspec, property_node);
            }

            return true;
        }
    }
}