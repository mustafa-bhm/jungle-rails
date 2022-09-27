describe("Product details", () => {
  it("should visit root", () => {
    cy.visit("/");
  });
  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });
  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });
  it("should get product details", () => {
    cy.get(".products article").last().click();
    cy.get(".product-detail").should("be.visible");
    cy.get(".product-detail h1").should("have.text", "Giant Tea");
  });
});
