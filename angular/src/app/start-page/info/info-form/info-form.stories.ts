import { Story, Meta } from '@storybook/angular/types-6-0';
import { moduleMetadata } from '@storybook/angular';
import { InfoFormComponent } from './info-form.component';
import { CommonModule } from '@angular/common';
import { style } from '@angular/animations';



export default {
  title: 'App/Info',
  component: InfoFormComponent,
  argTypes: {
    backgroundColor: { control: 'color' },
  },
  decorators: [
    moduleMetadata({
      imports: [CommonModule],
    }),
  ],
} as Meta;

const Template: Story<InfoFormComponent> = (args: InfoFormComponent) => ({
  props: args,
});

export const Demo = Template.bind({});
Demo.args = {
  listFeatures :[{title:'to get a list of registered at this chat-bot', content: 'click "Users" header-menu'},
    {title: 'to get a list of notifications for any user at the list', content:'click "UserName" in the list of users'},
    {title: 'to get a list of recommendations ', content:'click "Recommendations" in the header-menu'},
    {title: 'to create a new recommendation', content:'click plus on the Recommendations page'}
  ]
};
