module QueryByAttr
  extend ActiveSupport::Concern

  module ClassMethods
    def query_by_same_attr(attr)
      self.all.double_stacks_query(:same_attr_with, attr)
    end

    def query_by_similar_attr(attr)
      self.all.double_stacks_query(:similar_attr_with, attr)
    end
  end

  included do
    Array.class_eval do

      def double_stacks_query(query_method, query_attr)
        f = lambda do |output_arr,input_arr|
          if output_arr.blank?
            return input_arr
          else
            car = [output_arr.first]
            cdr = output_arr - car
            if (duplicated_arr = car[0].send(query_method, cdr, query_attr)).present?
              f.call(cdr - duplicated_arr, input_arr + duplicated_arr + car)
            else
              f.call(cdr, input_arr)
            end
          end
        end
        source_arr = self
        f.call(source_arr, [])
      end

    end
  end

  def same_attr_with(array, attr)
    array.select do |item|
      self.send(attr) == item.send(attr)
    end
  end

  ##if same words in items' attr >= 50% , they are similar items
  def similar_attr_with(arr, attr)
    words = self.send(attr).split.map(&:downcase)
    arr.select do |item|
      match_words = words.select do |word|
        item.send(attr).split.map(&:downcase).include? word
      end
      match_words.count / words.count >= 0.5
    end
  end

end
