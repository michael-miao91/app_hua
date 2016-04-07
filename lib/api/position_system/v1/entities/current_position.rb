module API
  module PositionSystem
    module V1
      module Entities
        class CurrentPosition < Grape::Entity
          #设置获取集合的根目录名字
          root 'current_position'
          # 下面是需要暴露的字段
          # expose :id, documentation: {type: Integer, desc: 'id of the node'}
          # expose :device_id, documentation: {type: Integer, desc: 'date when the note was created'}
          expose :lat, documentation: {type: String, desc: 'title of the node'}
          expose :lng, documentation: {type: String, desc: 'content of the node'}
        end

        class Log < Grape::Entity
          #设置获取集合的根目录名字
          root 'position_logs'
          # 下面是需要暴露的字段
          # expose :id, documentation: {type: Integer, desc: 'id of the node'}
          # expose :device_id, documentation: {type: Integer, desc: 'date when the note was created'}
          expose :lat, documentation: {type: String, desc: 'title of the node'}
          expose :lng, documentation: {type: String, desc: 'content of the node'}
          expose :created_at, documentation: {type: DateTime, desc: 'content of the node'}
        end

      end
    end
  end
end

