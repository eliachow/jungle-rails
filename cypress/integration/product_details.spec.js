// const { INTERNAL } = require("@rails/actioncable")

describe('home page', () => {
  beforeEach(() => {
    cy.visit('http://localhost:3000/')
  }) 

  it("Navigates to a product detail page when the product link is clicked", () => {
    cy.contains('article', 'Cliff Collard').click();
    cy.url().should('eq', 'http://localhost:3000/products/12')
  })
  })