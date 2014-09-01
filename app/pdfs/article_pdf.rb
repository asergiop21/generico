class ArticlePdf < Prawn::Document
require 'barby'
require 'barby/barcode/code_39'
require 'barby/outputter/prawn_outputter'

   def initialize(article)
      super(top_margin:70, page_size: "A4")
      @article = article

      barcode
      barcode_2
   end
   def barcode
      1.upto(10) do |i|
        x = 10 
        y = i * 70

      font_size(8)
        draw_text @article.barcode + " - " + @article.name, :at=> [x,y - 10 ]
        translate(x, y) do
         barcode = Barby::Code39.new @article.barcode
         barcode.annotate_pdf(self)
        end
   end
   end 
     def barcode_2
     1.upto(10) do |i|
        x = 300 
        y = i * 70
     
         font_size(8)
        draw_text @article.barcode + " - " + @article.name, :at=> [x,y - 10 ]
        translate(x, y) do
         barcode = Barby::Code39.new @article.barcode
         barcode.annotate_pdf(self)
      end
   end
   end
end
