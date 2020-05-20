Dir[File.join(__dir__, 'lib', '**', '*.rb')].each { |file| require file }
data1 = [
  { id: 1, title: "heading1", heading_level: 0 },
  { id: 2, title: "heading2", heading_level: 2 },
  { id: 3, title: "heading3", heading_level: 1 },
  { id: 4, title: "heading4", heading_level: 1 }

]

headings = Heading.load_data(data1)
headings.generate_numbers

p "********************************************************"

data2 = [
  { id: 1, title: "heading1", heading_level: 0 },
  { id: 2, title: "heading2", heading_level: 3 },
  { id: 3, title: "heading3", heading_level: 4 },
  { id: 4, title: "heading4", heading_level: 1 },
  { id: 5, title: "heading5", heading_level: 0 }
]

headings = Heading.load_data(data2)
headings.generate_numbers
