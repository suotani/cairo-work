require 'cairo'  # need install gem cairo -> 'gem install cairo'
require './gasket'
require './carpet'
require './Koch'
require './window'

# 背景


#フラクタル図形の作成
# klass = Gasket
# klass = Carpet
# klass = Koch
# klass = Koch2
klass = Koch3
window = Window.new(600, 600)
window.draw
fractal = klass.new(window)
fractal.create(ARGV[0].to_i)
# ファイル出力
window.file_output("#{klass::FILE_NAME}_#{ARGV[0]}")


